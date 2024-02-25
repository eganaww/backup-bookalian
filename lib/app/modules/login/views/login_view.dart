import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),*/
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/Logo-apk.png', // Ganti dengan path menuju gambar logo
                width: 200, // Sesuaikan dengan ukuran yang diinginkan
                height: 200,
              ),
              SizedBox(height: 20),
              Text("Login", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              // Spasi antara gambar dan form
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.usernameController,
                            decoration: InputDecoration(hintText: "Username"),
                            validator: (value){
                              if (value!.isEmpty){
                                return "Username tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: controller.passwordController,
                            decoration: InputDecoration(hintText: "Password"),
                            validator: (value){
                              if (value!.isEmpty){
                                return "Password tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Obx(() => controller.loading.value?
                    CircularProgressIndicator():
                    ElevatedButton(
                        onPressed: (){
                          controller.login();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade800), // Background hijau
                        ),
                        child: Text("Login", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),)
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Tidak punya akun?"),
                    ),
                    ElevatedButton(
                      onPressed: ()=>Get.toNamed(Routes.REGISTER),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Background putih
                      ),
                      child: const Text("Daftar", style: TextStyle(
                        color: Colors.green,
                      ),),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
