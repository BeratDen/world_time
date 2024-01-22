import 'package:flutter/material.dart';
import 'package:world_time/views/choose_location.dart';
import 'package:world_time/views/home.dart';
import 'package:world_time/views/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home': (context) => Home(),
    '/location' : (context) => ChooseLocation()
  },
));