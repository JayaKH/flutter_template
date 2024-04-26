part of 'counter_bloc.dart';

@freezedBloc
class CounterState with _$CounterState {
  const factory CounterState(int value) = _CounterState;

  factory CounterState.initial() => const CounterState(0);
}
