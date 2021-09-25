import 'package:flutter/material.dart';
import 'bindings/all_controller_bindings.dart';
import 'myApp.dart';


void main() {
  AllControllerBindings().dependencies();
  runApp(MyApp());
}

