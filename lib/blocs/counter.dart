import 'dart:async';

class CounterBloc {
  int _counter = 0;

  int get counter => _counter;

  //input controller
  StreamController _inputController = StreamController();
  StreamSink get inputan => _inputController.sink;
  
  //output controller
  StreamController _outputController = StreamController();
  StreamSink get _sinkOut => _outputController.sink;

  Stream get output => _outputController.stream;

  //mesinnya
  CounterBloc(){
    _inputController.stream.listen(
      (event) {
        if (event == 'add'){
          _counter++;
        } else {
          _counter--;
        }

        _sinkOut.add(_counter);
      },
      );
  }

  void dispose(){
    _inputController.close();
    _outputController.close();
  }
}