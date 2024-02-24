/// user_id : 2
/// book_id : 1

class ResponseKoleksi {
  ResponseKoleksi({
      this.userId, 
      this.bookId,});

  ResponseKoleksi.fromJson(dynamic json) {
    userId = json['user_id'];
    bookId = json['book_id'];
  }
  int? userId;
  int? bookId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['book_id'] = bookId;
    return map;
  }

}