class SupplierdetailModal {
  String? status;
  String? message;
  SupplierInfo? supplierInfo;

  SupplierdetailModal({this.status, this.message, this.supplierInfo});

  SupplierdetailModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    supplierInfo = json['supplierInfo'] != null
        ? new SupplierInfo.fromJson(json['supplierInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.supplierInfo != null) {
      data['supplierInfo'] = this.supplierInfo!.toJson();
    }
    return data;
  }
}

class SupplierInfo {
  String? id;
  String? name;
  String? email;
  String? profile;
  String? contact;
  String? address;
  String? description;
  Services? services;
  String? isRequested;

  SupplierInfo(
      {this.id,
      this.name,
      this.email,
      this.profile,
      this.contact,
      this.address,
      this.description,
      this.services,
      this.isRequested});

  SupplierInfo.fromJson(Map<String, dynamic> json) {
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
    isRequested = json['is_requested'];
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
    data['is_requested'] = this.isRequested;
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

  Services(
      {this.id,
      this.sId,
      this.categoryId,
      this.description,
      this.cost,
      this.createdAt});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sId = json['s_id'];
    categoryId = json['category_id'];
    description = json['description'];
    cost = json['cost'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['s_id'] = this.sId;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['cost'] = this.cost;
    data['created_at'] = this.createdAt;
    return data;
  }
}
