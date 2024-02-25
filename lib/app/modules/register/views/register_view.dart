import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar'),
        centerTitle: true,
      ),
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
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.namaController,
                      decoration: InputDecoration(hintText: "Masukkan Nama Lengkap"),
                      validator: (value){
                        if (value!.isEmpty){
                          return "Nama Lengkap tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.usernameController,
                      decoration: InputDecoration(hintText: "Masukkan Username"),
                      validator: (value){
                        if (value!.isEmpty){
                          return "Username tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.telpController,
                      decoration: InputDecoration(hintText: "Masukkan Email"),
                      validator: (value){
                        if (value!.isEmpty){
                          return "Nomor Telpon tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.alamatController,
                      decoration: InputDecoration(hintText: "Masukkan Alamat Rumah"),
                      validator: (value){
                        if (value!.isEmpty){
                          return "Alamat Rumah tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: InputDecoration(hintText: "Masukkan Password"),
                      validator: (value){
                        if (value!.isEmpty){
                          return "Password tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    Obx(() => controller.loading.value?
                    CircularProgressIndicator():
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: (){
                          controller.post();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade800),
                        ),
                        child: Text("Daftar", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                    ),
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
