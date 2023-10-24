class MySuppliersModal {
  String? status;
  String? message;
  List<SuppliersDetails>? suppliersDetails;

  MySuppliersModal({this.status, this.message, this.suppliersDetails});

  MySuppliersModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['suppliersDetails'] != null) {
      suppliersDetails = <SuppliersDetails>[];
      json['suppliersDetails'].forEach((v) {
        suppliersDetails!.add(new SuppliersDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.suppliersDetails != null) {
      data['suppliersDetails'] =
          this.suppliersDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SuppliersDetails {
  String? id;
  String? name;
  String? email;
  String? profile;
  String? contact;
  String? address;
  String? description;
  Services? services;

  SuppliersDetails(
      {this.id,
      this.name,
      this.email,
      this.profile,
      this.contact,
      this.address,
      this.description,
      this.services});

  SuppliersDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profile = json['profile'];
    contact = json['contact'];
    address = json['address'];
    description = json['description'];
    services = json['services'] != null
        ? new Services.fromJson(json['services'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile'] = this.profile;
    data['contact'] = this.contact;
    data['address'] = this.address;
    data['description'] = this.description;
    if (this.services != null) {
      data['services'] = this.services!.toJson();
    }
    return data;
  }
}

class Services {
  String? id;
  String? sId;
  String? categoryId;
  String? description;
  String? cost;
  String? createdAt;
  Category? category;

  Services(
      {this.id,
      this.sId,
      this.categoryId,
      this.description,
      this.cost,
      this.createdAt,
      this.category});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sId = json['s_id'];
    categoryId = json['category_id'];
    description = json['description'];
    cost = json['cost'];
    createdAt = json['created_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['s_id'] = this.sId;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['cost'] = this.cost;
    data['created_at'] = this.createdAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  String? categoryId;
  String? categoryIcon;
  String? categoryName;
  String? categoryDesc;
  String? createdAt;

  Category(
      {this.categoryId,
      this.categoryIcon,
      this.categoryName,
      this.categoryDesc,
      this.createdAt});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryIcon = json['category_icon'];
    categoryName = json['category_name'];
    categoryDesc = json['category_desc'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_icon'] = this.categoryIcon;
    data['category_name'] = this.categoryName;
    data['category_desc'] = this.categoryDesc;
    data['created_at'] = this.createdAt;
    return data;
  }
}
