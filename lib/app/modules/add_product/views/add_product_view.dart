import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: controller.nameC,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Nama Produk",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.priceC,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "Harga",
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () => controller.addProducts(
                    controller.nameC.text, controller.priceC.text),
                child: Text(
                  "Add Product",
                ),
              ),
            ],
          ),
        ));
  }
}
