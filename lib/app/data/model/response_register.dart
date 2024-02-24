/// nama : "said"
/// username : "said"
/// telp : "085"
/// alamat : "alamat"
/// password : "password"

class ResponseRegister {
  ResponseRegister({
      this.nama, 
      this.username, 
      this.telp, 
      this.alamat, 
      this.password,});

  ResponseRegister.fromJson(dynamic json) {
    nama = json['nama'];
    username = json['username'];
    telp = json['telp'];
    alamat = json['alamat'];
    password = json['password'];
  }
  String? nama;
  String? username;
  String? telp;
  String? alamat;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nama'] = nama;
    map['username'] = username;
    map['telp'] = telp;
    map['alamat'] = alamat;
    map['password'] = password;
    return map;
  }

}