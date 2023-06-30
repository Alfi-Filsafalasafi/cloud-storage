import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penduduk_controller.dart';

class PendudukView extends GetView<PendudukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PendudukView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => controller.filterData(17),
          child: Text(
            'Filter',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
