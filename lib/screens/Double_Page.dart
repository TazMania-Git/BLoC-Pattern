import 'package:bloc_pattern/blocs/counter_bloc.dart';
import 'package:bloc_pattern/blocs/counter_repository.dart';
import 'package:bloc_pattern/blocs/double_bloc.dart';
import 'package:flutter/material.dart';

class DoublePage extends StatefulWidget {
  const DoublePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DoublePage> createState() => _DoublePageState();
}

class _DoublePageState extends State<DoublePage> {
  int _counter = 0;
  DoubleBloc _bloc = DoubleBloc();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.sendEvent.add(FetchEvent());
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
                stream: _bloc.counterStream,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.sendEvent.add(ClearEvent());
            },
            tooltip: 'Zero',
            child: const Icon(Icons.clear),
          ),
          SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.sendEvent.add(DoubleEvent());
            },
            tooltip: 'Multiply',
            child: const Icon(Icons.trending_up),
          ),
        ],
      ),
    );
  }
}
