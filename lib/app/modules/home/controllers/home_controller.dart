import 'dart:convert';
import 'dart:io';
// import 'dart:ffi';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;
import 'package:get/get.dart';

class HomeController extends GetxController {
  s.FirebaseStorage storage = s.FirebaseStorage.instance;
  void akses() async {
    // var myRef = storage.ref();

    // var myList = await myRef.listAll();

    // print("Banyak data : ${myList.items.length}");

    // myList.items.forEach((element) {
    //   print(element);
    // });

    // print("========================");

    // print("Banyak folder : ${myList.prefixes.length}");

    // myList.prefixes.forEach((element) async {
    //   var myFolderRef = await storage.ref(element.name).listAll();
    //   print(
    //       "Banyak Data pada folder ${element.name} : ${myFolderRef.items.length}");
    //   myFolderRef.items.forEach((element) {
    //     print(element.name);
    //   });
    // });

    // var myList = await myRef.list(ListOptions(maxResults: 2));

    // print("Banyak data : ${myList.items.length}");

    // myList.items.forEach((element) async {
    //   // print(element.name);
    //   final url = await storage.ref(element.name).getDownloadURL();
    //   print(url);
    // });

    //Melakukan put string upload string
    // try {
    //   String dataUrl = 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ=='; //ini hasilnya bertuliskan "hello world"
    //   var myRef = storage.ref("Hello.txt");
    //   myRef.putString(dataUrl, format: PutStringFormat.dataUrl);
    //   print("Berhasil upload string");
    // } catch (e) {
    //   print("Gagal upload string $e");
    // }

    String text = "Alfi Filsafalasafi";
    List<int> encoded = utf8.encode(text);
    Uint8List data = Uint8List.fromList(encoded);
    s.Reference myRef = s.FirebaseStorage.instance.ref('/file/hello.txt/');

    try {
      // Upload raw data.
      await myRef.putData(data);
      // Uint8List downloaderData = await myRef.getData();
      print("Behasil");
    } catch (e) {
      // ...
    }
  }

  void uploadFile() async {
    //upload 1 file
    // FilePickerResult? result = await FilePicker.platform.pickFiles();

    // if (result != null) {
    //   File file = File(result.files.single.path!);
    //   print(file);
    //   String fileName = result.files.first.name;
    //   String? ext = result.files.first.extension;
    //   try {
    //     await s.FirebaseStorage.instance.ref('/file/$fileName').putFile(file);
    //     print("Berhasil upload file");
    //   } catch (e) {
    //     print("Gagal Upload karena $e");
    //   }
    // } else {
    //   print("Tidak jadi mebngupload file");
    // }

    //upload lebih dari 1 file
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      // List<File> files = result.paths.map((path) => File(path)).toList();
      result.files.forEach((element) async {
        String name = element.name;
        File file = File(element.path!);

        try {
          await s.FirebaseStorage.instance.ref('/file/$name').putFile(file);
          print("Berhasil upload file");
        } on s.FirebaseException catch (e) {
          print("Gagal Upload karena $e");
        }
      });
    } else {
      print("Batal upload");
    }
  }
}
