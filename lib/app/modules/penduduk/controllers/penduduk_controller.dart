import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PendudukController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void filterData(int age) async {
    final result =
        // await firestore.collection("users").where("age", isEqualTo: age).get();
        // await firestore
        //     .collection("users")
        //     .where("motor", arrayContainsAny: ["Jupiter", "Supra X"]).get();
        // await firestore
        //     .collection("users")
        //     .where("motor", arrayContains: "Jupiter")
        //     .get();

        //     await firestore.collection("users").where(
        //   "motor",
        //   whereIn: [
        //     ["Revo", "Jupiter"],
        //     ["Repsol", "Supra"],
        //   ],
        // ).get();

        await firestore
            .collection("users")
            .where("age", isGreaterThan: 21)
            .orderBy("age")
            // .limitToLast(5)
            .get();

    if (result.docs.length > 0) {
      print("total data : ${result.docs.length}");
      result.docs.forEach((element) {
        var id = element.id;
        var data = element.data();
        print("ID = $id");
        print("data = $data");
      });
    } else {
      print("Tidak ada data");
    }
  }
}
