// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// const url = 'https://www.manchesterdigital.com/storage/13254/flutter-3.png';

// enum Action { rotateLeft, rotateRight, moreVisible, lessVisible }

// @immutable
// class State {
//   final double rotationDeg;
//   final double alpha;
//   const State({
//     required this.rotationDeg,
//     required this.alpha,
//   });
//   const State.zero()
//       : rotationDeg = 0.0,
//         alpha = 1.0;
//   State rotatRight() => State(alpha: alpha, rotationDeg: rotationDeg + 10);
//   State rotateLeft() => State(alpha: alpha, rotationDeg: rotationDeg + 10);
//   State increaseAlpha() =>
//       State(rotationDeg: rotationDeg, alpha: min(alpha + 0.1, 1.0));
//   State decreaseAlpha() =>
//       State(rotationDeg: rotationDeg, alpha: max(alpha - 0.1, 0.0));
// }

// State reducer(State oldState, Action? action) {
//   switch (action) {
//     case Action.rotateLeft:
//       return oldState.rotateLeft();

//     case Action.rotateRight:
//       return oldState.rotatRight();

//     case Action.moreVisible:
//       return oldState.increaseAlpha();

//     case Action.lessVisible:
//       return oldState.decreaseAlpha();

//     case null:
//       return oldState;
//     // default:
//   }
// }

// class MyHomePage extends HookWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final store = useReducer<State, Action?>(reducer,
//         initialState: State.zero(), initialAction: null);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Hoe Page'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 100,
//             child: Row(
//               children: [
//                 RotateLeftButton(store: store),
//                 RoateRightButton(store: store),
//                 LessVisible(store: store),
//                 MOreVisible(store: store),
//               ],
//             ),
//           ),
//           Opacity(
//             opacity: store.state.alpha,
//             child: RotationTransition(
//                 turns: AlwaysStoppedAnimation(store.state.rotationDeg / 360),
//                 child: Image.network(url)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MOreVisible extends StatelessWidget {
//   const MOreVisible({
//     super.key,
//     required this.store,
//   });

//   final Store<State, Action?> store;

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//         onPressed: () {
//           store.dispatch(Action.moreVisible);
//         },
//         child: Text('+alpha'));
//   }
// }

// class LessVisible extends StatelessWidget {
//   const LessVisible({
//     super.key,
//     required this.store,
//   });

//   final Store<State, Action?> store;

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//         onPressed: () {
//           store.dispatch(Action.lessVisible);
//         },
//         child: Text('- Alpha'));
//   }
// }

// class RoateRightButton extends StatelessWidget {
//   const RoateRightButton({
//     super.key,
//     required this.store,
//   });

//   final Store<State, Action?> store;

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//         onPressed: () {
//           store.dispatch(Action.rotateRight);
//         },
//         child: Text('Rotate Right'));
//   }
// }

// class RotateLeftButton extends StatelessWidget {
//   const RotateLeftButton({
//     super.key,
//     required this.store,
//   });

//   final Store<State, Action?> store;

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//         onPressed: () {
//           store.dispatch(Action.rotateLeft);
//         },
//         child: Text('Rotate left'));
//   }
// }
