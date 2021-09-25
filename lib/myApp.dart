import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtech_jubayer_bin_montasir/view/product_details_view.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductDetailsView(),
    );
  }
}
