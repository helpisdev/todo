import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

/// Application's main function
Future<void> main() async {
  await init();
  runApp(
    CRDP(),
  );
}
