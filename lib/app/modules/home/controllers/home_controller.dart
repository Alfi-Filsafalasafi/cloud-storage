import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection("products");

    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("products");
    // return products.orderBy("time", descending: true).snapshots();
    return products
        // .where("price",isGreaterThanOrEqualTo: 100000) //lebih besar sama dengan
        // .where("price", isGreaterThan: 100000) //lebih besar
        .orderBy("time", descending: true)
        .snapshots();
  }

  void deleteProduct(String docID) {
    DocumentReference docRef = firestore.collection("products").doc(docID);

    try {
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Apakah kamu yakin menghapus data ini",
        onConfirm: () async {
          await docRef.delete();
          Get.back();
        },
        textConfirm: "Yes",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "tidak berhasil menghapus data ini",
      );
    }
  }
}
