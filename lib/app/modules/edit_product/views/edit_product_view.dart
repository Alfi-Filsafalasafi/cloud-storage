import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_product_controller.dart';

class EditProductView extends GetView<EditProductController> {
  const EditProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
          centerTitle: true,
        ),
        body: FutureBuilder<DocumentSnapshot<Object?>>(
            future: controller.getData(Get.arguments),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var data = snapshot.data!.data() as Map<String, dynamic>;
                controller.nameC.text = data["name"];
                controller.priceC.text = data["price"].toString();
                return Padding(
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
                        onPressed: () => controller.editProducts(
                            controller.nameC.text,
                            controller.priceC.text,
                            Get.arguments),
                        child: Text(
                          "Edit Product",
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
