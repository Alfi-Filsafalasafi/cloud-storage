import 'package:cobafirebasealfi/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String Password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: Password,
      );
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            title: "Verification Email",
            middleText:
                "Kamu perlu melakukan verifikasi email, apakah kamu butuh verifikasi ulang ?",
            onConfirm: () async {
              await myUser.user!.sendEmailVerification();
              Get.back();
            },
            textConfirm: "Kirim Ulang",
            textCancel: "Tidak");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak ditemukan user dengan email tersebut",
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Password yang anda masukkan salah",
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat login karena $e",
      );
    }
  }

  void signup(String email, String password) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
        title: "Verification Email",
        middleText:
            "Kami telah mengirim verifikasi ke email $email. silahkan verifikasi",
        onConfirm: () {
          Get.back(); //close dialog
          Get.back(); //go to login page
        },
        textConfirm: "Ya, saya akan cek email",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Email telah digunakan. Silahkan gunakan email lain",
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat mendaftar, karena $e",
      );
    }
  }

  void reset_password(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Kami telah mengirimkan reset password ke email $email",
          onConfirm: () {
            Get.back(); // close dialog
            Get.back(); // go to login page
          },
          textConfirm: "Ya, Aku Mengerti",
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak dapat melakukan reset password karena $e",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Email tidak valid.",
      );
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
