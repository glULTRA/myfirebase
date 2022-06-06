import 'package:flutter/material.dart';

InputDecoration textInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      color: Colors.pink,
      width: 2.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      color: Colors.pink,
      width: 2.0,
    ),
  ),
  hintText: 'Email address',
  hintStyle: TextStyle(color: Colors.pink[600]),
  suffixIcon: Icon(
    Icons.email,
    color: Colors.pink[600],
  ),
);
