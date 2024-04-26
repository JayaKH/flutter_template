import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template/application/counter/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    test('initial state is 0', () {
      expect(CounterBloc().state, equals(const CounterState(0)));
    });

    blocTest<CounterBloc, CounterState>(
      'emits [1] when increment is called',
      build: CounterBloc.new,
      act: (bloc) => bloc.add(const CounterEvent.increment()),
      expect: () => [equals(const CounterState(1))],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [-1] when decrement is called',
      build: CounterBloc.new,
      act: (bloc) => bloc.add(const CounterEvent.decrement()),
      expect: () => [equals(const CounterState(-1))],
    );
  });
}
