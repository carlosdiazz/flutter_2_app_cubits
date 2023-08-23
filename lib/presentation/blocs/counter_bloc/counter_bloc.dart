import "package:flutter_bloc/flutter_bloc.dart";
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    //Aqui escucho el Evento y mando el Emit
    on<CounterIncreased>(_onCounterIncreased);

    on<CounterReset>(_onCounterReset);

    //Otra forma de hacerlo
    //on<CounterIncreased>((event, emit) => _onCounterIncreased(event, emit),);
  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        counter: 0, transactionCount: state.transactionCount + 1));
  }
}
