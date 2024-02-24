import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  post() async {
    loading(true);
    try{
      FocusScope.of(Get.context!).unfocus();
      if(formKey.currentState!.validate()){
        final response = await ApiProvider.instance().post(Endpoint.register,
            data: {
              "nama": namaController.text.toString(),
              "username": usernameController.text.toString(),
              "telp": telpController.text.toString(),
              "alamat": alamatController.text.toString(),
              "password": passwordController.text.toString()
            });
        if (response.statusCode == 201) {
          Get.offAllNamed(Routes.LOGIN);
        } else {
          Get.snackbar("Sorry", "Anda gagal daftar", backgroundColor: Colors.orange);
        }
      }loading(false);
    } on DioException catch (e) {
      loading(false);
      if(e.response != null) {
        if(e.response?.data != null){
          Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {loading(false);
    Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
