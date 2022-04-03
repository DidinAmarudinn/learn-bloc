
import 'dart:async';

class CounterBloc{
  int counter = 0;
  StreamController<CounterEvent> _eventController = StreamController<CounterEvent>();
  StreamSink get eventSink => _eventController.sink;
  StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get _counterSink => _counterController.sink;
  Stream<int> get counterStream => _counterController.stream;


  CounterBloc(){
    _eventController.stream.listen(mapEventToState);
  }

  void mapEventToState(CounterEvent event){
    if (event == CounterEvent.increment){
      counter++;
    }else{
      counter--;
    }

    _counterSink.add(counter);
  }

  void dispose(){
    _eventController.close();
    _counterController.close();
  }
}









enum CounterEvent {increment, decrement}
