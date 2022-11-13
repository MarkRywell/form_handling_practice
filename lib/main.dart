import 'package:flutter/material.dart';
import 'package:form_handling_practice/home_page.dart';

void main () => runApp(
  MaterialApp(
    title: "Form Handling Practice",
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage()
  )
);