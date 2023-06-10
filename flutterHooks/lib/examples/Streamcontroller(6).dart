import 'dart:async';
import 'dart:math';

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

const url = 'https://www.manchesterdigital.com/storage/13254/flutter-3.png';
const imageHeight = 300.0;

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late final StreamController<double> controller;
    controller = useStreamController<double>(onListen: () {
      controller.sink.add(0.0);
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HomePage'),
      ),
      body: StreamBuilder<double>(
          stream: controller.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              final rotation = snapshot.data ?? 0.0;

              return GestureDetector(
                onTap: () {
                  controller.sink.add(rotation + 10.0);
                },
                onDoubleTap: () {
                  controller.sink.add(rotation - 10.0);
                },
                child: RotationTransition(
                    turns: AlwaysStoppedAnimation(rotation / 360),
                    child: Center(child: Image.network(url))),
              );
            }
          }),
    );
  }
}
