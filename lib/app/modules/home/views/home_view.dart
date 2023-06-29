import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cobafirebasealfi/app/controllers/auth_controller.dart';
import 'package:cobafirebasealfi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => authC.logout(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //     future: controller.getData(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         var listAllDocs = snapshot.data!.docs;
      //         return ListView.builder(
      //           itemCount: listAllDocs.length,
      //           itemBuilder: (context, index) => ListTile(
      //             title: Text(
      //                 "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}"),
      //             subtitle: Text(
      //                 "Rp. ${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}"),
      //           ),
      //         );
      //       }
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     },),

      //Real Time Database
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            //kalau realtime pakai active
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}"),
                subtitle: Text(
                    "Rp. ${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}"),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
      ),
    );
  }
}
