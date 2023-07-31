// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, must_be_immutable, prefer_typing_uninitialized_variables, avoid_types_as_parameter_names

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  var onChangedStep;


  function(int) => onChangedStep;
  AuthScreen({super.key, required this.onChangedStep});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex= RegExp(r"^[A-Za-z0-9+_.-]+@(.+)$");

  late String _email = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Everyone has\n'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                      ),
                      children: [
                        TextSpan(
                          text: 'knowledge\n'.toUpperCase(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'to share.\n'.toUpperCase(),
                        ),
                        TextSpan(
                          text: 'It all starts here.',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Enter your email'),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _email = value),
                        validator: (value) =>
                          value!.isEmpty || !emailRegex.hasMatch(value) 
                            ? 'Please enter a valid email' 
                            : null,
                        decoration: InputDecoration(
                          hintText: 'Ex: lucas.roche@domain.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                        ),
                        onPressed: !emailRegex.hasMatch(_email) ? null : () {
                          if (_formKey.currentState!.validate() ) {
                            print(_email);
                            widget.onChangedStep(1);
                          }
                        },
                        child: Text('continue'.toUpperCase()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
