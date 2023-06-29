import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late TextEditingController nameC;
  late TextEditingController priceC;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("products").doc(docID);
    return docRef.get();
  }

  void editProducts(String name, String price, String docID) async {
    DocumentReference docData = firestore.collection("products").doc(docID);

    try {
      String dateNow = DateTime.now().toIso8601String();
      await docData.update(
        {
          "name": name,
          "price": int.parse(price),
          "time": dateNow,
        },
      );

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah produk $name",
        onConfirm: () {
          nameC.clear();
          priceC.clear();
          Get.back(); //close dialog
          Get.back(); //back to homepage
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Gagal",
        middleText: "Tidak Berhasil mengubah produk",
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
