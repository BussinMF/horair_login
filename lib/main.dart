// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:horair_login/screens/Guest.dart';
import 'package:horair_login/screens/guest/Auth.dart';
import 'package:horair_login/screens/guest/Password.dart';
import 'package:horair_login/screens/guest/Terms.dart';

void main() =>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Leadee',
      home: GuestScreen(),
    );
  }
}