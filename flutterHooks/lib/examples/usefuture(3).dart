// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// //compact map
// extension ContactMap<T> on Iterable<T?> {
//   Iterable<T> compactMap<E>([
//     E? Function(T?)? transform,
//   ]) =>
//       map(
//         transform ?? (e) => e,
//       ).where((element) => element != null).cast();
// }

// void test() {
//   final values = [1, 2, 3, null];
//   final nonnullvalues = values.compactMap((e) {
//     if (e != null && e > 10) {
//       return e;
//     } else {
//       return null;
//     }
//   });
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// const url = 'https://www.manchesterdigital.com/storage/13254/flutter-3.png';

// class MyHomePage extends HookWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     /** 
//      *  first this then it overwrites by useMemoized
//      * 
//      * 'final image = useFuture(NetworkAssetBundle(Uri.parse(url))
//         .load(url)
//         .then((value) => value.buffer.asUint8List())
//         .then((data) => Image.memory(data)));'
//         */
//     final future = useMemoized(() => NetworkAssetBundle(Uri.parse(url))
//         .load(url)
//         .then((value) => value.buffer.asUint8List())
//         .then((data) => Image.memory(data)));
// //NetworkAssetBundle is future image
//     final snapshot = useFuture(future);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HomePage'),
//       ),
//       body: Column(
//         children: [snapshot.data].compactMap().toList(),
//       ),
//     );
//   }
// }
// // use future is an async snapshot value that doesn't persist the future in memory
// // use Memoized-> it creates caching mechanism for complex  objects