import 'dart:async';
import 'package:dro_health_task/bloc/inc_dec_quantity/quantity_event.dart';
import 'package:flutter/foundation.dart';


class CounterBloc with ChangeNotifier{
  int _counter = 1;
  final _streamControllerEvent = StreamController<int>();

  StreamSink<int> get _inCounter => _streamControllerEvent.sink;

  Stream<int> get counter => _streamControllerEvent.stream;

  final _counterControllerEvent = StreamController<CounterEvent>();

  Sink<CounterEvent> get  counterEventSink => _counterControllerEvent.sink;


  CounterBloc(){
    _counterControllerEvent.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event){
    if(event is IncrementCounterEvent){
      _counter++;
    }
    else if(event is DecrementCounterEvent ){
      if(_counter >1){
        _counter--;
      }
      else
        _counter = 1;
    }
    _inCounter.add(_counter);
    returnCounter(_counter);
  }
  int returnCounter(int counter){
    notifyListeners();
    return counter;
  }
  void dispose(){
    _counterControllerEvent.close();
    _streamControllerEvent.close();
  }
}