import 'package:bloc/bloc.dart';
import 'package:counterapp/bloc/counter/counter_event.dart';
import 'package:counterapp/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{

  CounterBloc() :super(CounterState()){
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    on<ResetCounter>(_reset);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit ){
    if(state.counter < 10){
      emit(state.copyWith(counter: state.counter + 1));
    }
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit ){
    if(state.counter > 0){
      emit(state.copyWith(counter: state.counter - 1));
    }
  }

  void _reset(ResetCounter event, Emitter<CounterState> emit ){
    emit(state.copyWith(counter: 0));
  }
}