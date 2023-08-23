part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

//Evento para incrementar el valor
class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);
}

// CounterReset
class CounterReset extends CounterEvent {}
