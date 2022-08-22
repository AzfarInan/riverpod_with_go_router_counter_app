import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_app_with_go_router/utils/app_pages.dart';

/// NEW CODES
abstract class WebSocketClient {
  Stream<int> getCounterStream([int start]);
}

class FakeWebSocketClient implements WebSocketClient {
  @override
  Stream<int> getCounterStream([int start = 0]) async* {
    int i = start;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield i++;
    }
  }
}

final webSocketClientProvider = Provider<WebSocketClient>((ref) {
  return FakeWebSocketClient();
});

final counterProvider = StreamProvider.family<int, int>((ref, start) {
  final wsClient = ref.watch(webSocketClientProvider);
  return wsClient.getCounterStream(start);
});
///


// OLD CODES
/*
final counterProvider = StateProvider((ref) => 0);
 */

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Counter App',
      routeInformationProvider: AppPages.router.routeInformationProvider,
      routeInformationParser: AppPages.router.routeInformationParser,
      routerDelegate: AppPages.router.routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
          surface: const Color(0xFF003909),
        ),
      ),
    );
  }
}