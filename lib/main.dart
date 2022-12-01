import 'package:flutter/material.dart';
import 'homepage.dart';
import 'results.dart';

void main()=>runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/homepage',
    routes: {
      '/homepage':(context)=>Homepage(),
    }
  )
);
