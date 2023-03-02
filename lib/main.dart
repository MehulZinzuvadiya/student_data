import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_data/screen/provider/home_provider.dart';
import 'package:student_data/screen/view/homeScreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HomeProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
      },
    ),
  ));
}
