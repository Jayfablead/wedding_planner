class ReusestViewSuppliersModal {
  String? status;
  String? message;
  List<Suppliers>? suppliers;

  ReusestViewSuppliersModal({this.status, this.message, this.suppliers});

  ReusestViewSuppliersModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['suppliers'] != null) {
      suppliers = <Suppliers>[];
      json['suppliers'].forEach((v) {
        suppliers!.add(new Suppliers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.suppliers != null) {
      data['suppliers'] = this.suppliers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suppliers {
  String? id;
  String? name;
  String? email;
  String? profile;
  String? contact;
  String? address;
  String? categoryId;
  String? categoryName;
  String? description;

  Suppliers(
      {this.id,
        this.name,
        this.email,
        this.profile,
        this.contact,
        this.address,
        this.categoryId,
        this.categoryName,
        this.description});

  Suppliers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profile = json['profile'];
    contact = json['contact'];
    address = json['address'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile'] = this.profile;
    data['contact'] = this.contact;
    data['address'] = this.address;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['description'] = this.description;
    return data;
  }
}
