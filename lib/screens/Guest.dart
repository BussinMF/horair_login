// ignore_for_file: avoid_unnecessary_containers, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:horair_login/screens/guest/Password.dart';
import 'package:horair_login/screens/guest/Terms.dart';
import 'package:horair_login/screens/guest/auth.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  
  final List<Widget> _widgets = [];
  late int _indexSelected = 0;

  @override
  void initState() {
    super.initState();
    _widgets.addAll([
      AuthScreen(onChangedStep: (index) => setState(() => _indexSelected = index)
      ),
      TermsScreen(onChangedStep: (index) => setState(() => _indexSelected = index)
      ),
      PasswordScreen(onChangedStep: (index) => setState(() => _indexSelected = index)
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}