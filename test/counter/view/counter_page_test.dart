import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/counter/counter_bloc.dart';
import 'package:flutter_template/presentation/counter/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockCounterBloc extends MockBloc<CounterEvent, CounterState>
    implements CounterBloc {}

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const CounterPage());
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group('CounterView', () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = MockCounterBloc();
    });

    testWidgets('renders current count', (tester) async {
      const value = 42;
      when(() => counterBloc.state).thenReturn(const CounterState(value));
      await tester.pumpApp(
        BlocProvider.value(
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      expect(find.text('$value'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      when(() => counterBloc.state).thenReturn(const CounterState(0));
      when(() => counterBloc.add(const CounterEvent.increment()))
          .thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.add));
      verify(() => counterBloc.add(const CounterEvent.increment())).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      when(() => counterBloc.state).thenReturn(const CounterState(0));
      when(() => counterBloc.add(const CounterEvent.decrement()))
          .thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => counterBloc.add(const CounterEvent.decrement())).called(1);
    });
  });
}
