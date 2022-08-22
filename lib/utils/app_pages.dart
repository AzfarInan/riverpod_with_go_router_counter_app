import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_counter_app_with_go_router/utils/routes.dart';
import 'package:riverpod_counter_app_with_go_router/view/counter_screen/counter_screen.dart';
import 'package:riverpod_counter_app_with_go_router/view/home_screen/home_screen.dart';

abstract class AppPages {
  AppPages._();

  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: Routes.homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: Routes.counterScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const CounterScreen();
        },
      ),
    ],
  );
}
