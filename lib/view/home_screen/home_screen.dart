import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_counter_app_with_go_router/utils/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Counter Page"),
          onPressed: () {
            context.push(Routes.counterScreen);
          },
        ),
      ),
    );
  }

}