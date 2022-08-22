import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_app_with_go_router/main.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///NEW CODES
    int startingValue = 5;
    final AsyncValue<int> counter = ref.watch(counterProvider(startingValue+1));
    ///

    ///OLD CODES
    /*
    final int counter = ref.watch(counterProvider);


    ref.listen(counterProvider, (previous, next) {
      if (next! as int >= 5) {
        showDialog(
            context: context,
            builder: (ctx) {
              return CupertinoAlertDialog(
                title: const Text("Warning!"),
                content: const Text(
                    "Counter dangerously high. Consider resetting it."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'),
                  )
                ],
              );
            });
      }
    });
     */

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        /*
        /// OLD CODES
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(counterProvider);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
         */
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Text(
              ///OLD CODE
              // counter.toString(),

              ///NEW CODE
              counter
                  .when(
                      data: (int value) => value,
                      error: (Object e, _) => e,
                      loading: () => startingValue)
                  .toString(),
              ///
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            child: const Text("Go back to Home"),
            onPressed: () {
              context.pop();
            },
          ),
          const Spacer(),
        ],
      ),

      /// OLD CODES
      /*
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
      ),
       */
    );
  }
}
