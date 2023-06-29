import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late TextEditingController nameC;
  late TextEditingController priceC;

  void addProducts(String name, String price) async {
    CollectionReference products = firestore.collection("products");

    try {
      await products.add(
        {
          "name": name,
          "price": price,
        },
      );

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan produk",
        onConfirm: () => Get.back(),
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Gagal",
        middleText: "Tidak Berhasil menambahkan produk",
      );
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }
}
