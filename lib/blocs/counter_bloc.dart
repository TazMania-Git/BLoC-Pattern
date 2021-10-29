import 'dart:async';

import 'package:bloc_pattern/blocs/counter_repository.dart';
import 'package:bloc_pattern/blocs/double_bloc.dart';

class CounterBase {}

class IncrementCounter extends CounterBase {}

class ClearCounter extends CounterBase {}

class FetchCounter extends CounterBase {}

class CounterBloc {
  CounterRepository repository = CounterRepository();
  StreamController<CounterBase> _input = StreamController();
  StreamController<int> _output = StreamController();

  Stream<int> get counterStream => _output.stream;
  StreamSink<CounterBase> get sendEvent => _input.sink;

  CounterBloc() {
    _input.stream.listen(_onEvent);
  }
  void dispose() {
    _input.close();
    _output.close();
  }

  void _onEvent(CounterBase event) {
    if (event is IncrementCounter) {
      repository.increment();
    } else if (event is ClearCounter) {
      repository.clear();
    }

    _output.add(repository.get());
  }
}
