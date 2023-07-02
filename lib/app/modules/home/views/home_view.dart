import 'package:cobafirebasealfi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => controller.akses(),
        onPressed: () => controller.uploadFile(),
        child: Icon(Icons.add),
      ),
    );
  }
}
