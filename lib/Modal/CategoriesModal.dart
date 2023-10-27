class CategoriesModal {
  String? status;
  String? message;
  List<Services>? services;

  CategoriesModal({this.status, this.message, this.services});

  CategoriesModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String? categoryId;
  String? categoryIcon;
  String? categoryName;
  String? categoryDesc;
  String? createdAt;
  Supplier? supplier;

  Services(
      {this.categoryId,
      this.categoryIcon,
      this.categoryName,
      this.categoryDesc,
      this.createdAt,
      this.supplier});

  Services.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryIcon = json['category_icon'];
    categoryName = json['category_name'];
    categoryDesc = json['category_desc'];
    createdAt = json['created_at'];
    supplier = json['supplier'] != null
        ? new Supplier.fromJson(json['supplier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_icon'] = this.categoryIcon;
    data['category_name'] = this.categoryName;
    data['category_desc'] = this.categoryDesc;
    data['created_at'] = this.createdAt;
    if (this.supplier != null) {
      data['supplier'] = this.supplier!.toJson();
    }
    return data;
  }
}

class Supplier {
  String? id;
  String? name;

  Supplier({this.id, this.name});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
