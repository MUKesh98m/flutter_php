class data_con {
  final String id;
  final String name;
  final String price;

  data_con({required this.id, required this.name, required this.price});
  factory data_con.fromJson(Map<String, dynamic> json) {
    return data_con(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}

class insertdata {
  final String id;

  final String email;
  final String password;

  insertdata({required this.id, required this.email, required this.password});
  factory insertdata.fromJson(Map<String, dynamic> json) {
    return insertdata(
        id: json['id'], email: json['email'], password: json['password']);
  }
}

class insertpdf {
  final String id;
  final String pdf;

  insertpdf({required this.id, required this.pdf});
  factory insertpdf.fromJson(Map<String, dynamic> json) {
    return insertpdf(id: json['Id'], pdf: json['pdf']);
  }
}