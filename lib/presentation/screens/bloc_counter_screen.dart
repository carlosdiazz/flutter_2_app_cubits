import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Propio
import 'package:flutter_2_forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    //context.read<CounterBloc>().add(CounterIncreased(value));
    context.read<CounterBloc>().increaseBy(value);
  }

  void resetCounter(BuildContext context) {
    context.read<CounterBloc>().add(CounterReset());
  }

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Counter: ${counter.transactionCount}"),
        actions: [
          IconButton(
              onPressed: () => resetCounter(context),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) =>
            Text("Counter Value: ${counterBloc.state.counter}")),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: "1",
              child: const Text("+10"),
              onPressed: () => increaseCounterBy(context, 10)),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              heroTag: "2",
              child: const Text("+5"),
              onPressed: () => increaseCounterBy(context, 5)),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: "3",
            child: const Text("+1"),
            onPressed: () => increaseCounterBy(context),
          )
        ],
      ),
    );
  }
}
