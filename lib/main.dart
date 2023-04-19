import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/provider.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final _counterProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context) {
    print("MyhomePage rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                Text(ref.watch(titleProvider))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                    Text(ref.watch(massageProvider))),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                  Text(
                ref.watch(_counterProvider).toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) =>
            FloatingActionButton(
          onPressed: () => ref
              .read(_counterProvider.notifier)
              .update((state) => state + 1), //一時的なデータの取得なのでread
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
