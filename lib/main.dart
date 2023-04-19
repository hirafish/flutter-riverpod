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
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final _counterProvider = StateProvider<int>((ref) => 0);
  @override
  Widget build(BuildContext context) {
    print("MyhomePage rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(titleProvider)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(ref.watch(messageProvider)),
            Text(
              ref.watch(CountDataProvider).count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () => ref.read(CountDataProvider.notifier).state =
                      ref.read(CountDataProvider).copyWith(),
                  child: const Icon(Icons.bakery_dining),
                ),
                FloatingActionButton(
                  onPressed: () => ref
                      .read(_counterProvider.notifier)
                      .update((state) => state + 1), //一時的なデータの取得なのでread
                  child: const Icon(Icons.ramen_dining),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(ref.watch(CountDataProvider).countUp.toString()),
                Text(ref.watch(CountDataProvider).countDown.toString()),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref
            .read(_counterProvider.notifier)
            .update((state) => state + 1), //一時的なデータの取得なのでread
        tooltip: 'modoseruyo',
        child: const Icon(Icons.cruelty_free),
      ),
    );
  }
}
