class CounterRepository {
  int _count = 0;

/// SINGLETON ///////////////////////////
  static CounterRepository _instance = CounterRepository.internal();
  CounterRepository.internal();

  factory CounterRepository() {
    return _instance;
  }
//// END SINGLETON ///////////////////

  int get() {
    return _count;
  }

  void increment() {
    _count++;
  }

  void clear() {
    _count = 0;
  }

  void double() {
    _count *= 2;
  }
}
