import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obScureText;
  final ValueChanged<String>? onChanged;


  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obScureText,
    this.onChanged
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: TextField(
          controller: controller,
          obscureText: obScureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: hintText,
          ),
          onChanged: onChanged,
        ),
        );
  }
}