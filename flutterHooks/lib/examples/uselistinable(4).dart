import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//compact map
extension ContactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(
        transform ?? (e) => e,
      ).where((element) => element != null).cast();
}

void test() {
  final values = [1, 2, 3, null];
  final nonnullvalues = values.compactMap((e) {
    if (e != null && e > 10) {
      return e;
    } else {
      return null;
    }
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final countDown = useMemoized(() => CountDown(
        from: 20)); // it cached data but doesn not calling build function

    final notifier = useListenable(
        countDown); // it calling build function when the value changes
    print('object');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HomePage'),
      ),
      body: Center(
        child: Text(notifier.value.toString()),
      ),
    );
  }
}

class CountDown extends ValueNotifier<int> {
  late StreamSubscription sub;

  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(Duration(seconds: 1), (v) => from - v)
        .takeWhile((element) => element >= 0)
        .listen((value) {
      this.value = value;
    });
  }
  @override
  void dispose() {
    sub.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
