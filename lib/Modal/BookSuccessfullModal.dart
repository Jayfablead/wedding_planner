class BookSuccessfullModal {
  String? status;
  String? message;
  SupplierInfo? supplierInfo;
  BookingInfo? bookingInfo;

  BookSuccessfullModal(
      {this.status, this.message, this.supplierInfo, this.bookingInfo});

  BookSuccessfullModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    supplierInfo = json['supplierInfo'] != null
        ? new SupplierInfo.fromJson(json['supplierInfo'])
        : null;
    bookingInfo = json['bookingInfo'] != null
        ? new BookingInfo.fromJson(json['bookingInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.supplierInfo != null) {
      data['supplierInfo'] = this.supplierInfo!.toJson();
    }
    if (this.bookingInfo != null) {
      data['bookingInfo'] = this.bookingInfo!.toJson();
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
  String? inBudget;
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
        this.inBudget,
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
    inBudget = json['in_budget'];
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
    data['in_budget'] = this.inBudget;
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
  String? categoryIcon;
  String? categoryName;
  String? categoryDesc;

  Services(
      {this.id,
        this.sId,
        this.categoryId,
        this.description,
        this.cost,
        this.createdAt,
        this.categoryIcon,
        this.categoryName,
        this.categoryDesc});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sId = json['s_id'];
    categoryId = json['category_id'];
    description = json['description'];
    cost = json['cost'];
    createdAt = json['created_at'];
    categoryIcon = json['category_icon'];
    categoryName = json['category_name'];
    categoryDesc = json['category_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['s_id'] = this.sId;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['cost'] = this.cost;
    data['created_at'] = this.createdAt;
    data['category_icon'] = this.categoryIcon;
    data['category_name'] = this.categoryName;
    data['category_desc'] = this.categoryDesc;
    return data;
  }
}

class BookingInfo {
  String? id;
  String? uid;
  String? bookingNo;
  String? supplierId;
  String? categoryId;
  String? bComment;
  String? bDate;
  String? bTime;
  String? bStatus;
  String? createdAt;
  String? updatedAt;

  BookingInfo(
      {this.id,
        this.uid,
        this.bookingNo,
        this.supplierId,
        this.categoryId,
        this.bComment,
        this.bDate,
        this.bTime,
        this.bStatus,
        this.createdAt,
        this.updatedAt});

  BookingInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    bookingNo = json['booking_no'];
    supplierId = json['supplier_id'];
    categoryId = json['category_id'];
    bComment = json['b_comment'];
    bDate = json['b_date'];
    bTime = json['b_time'];
    bStatus = json['b_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['booking_no'] = this.bookingNo;
    data['supplier_id'] = this.supplierId;
    data['category_id'] = this.categoryId;
    data['b_comment'] = this.bComment;
    data['b_date'] = this.bDate;
    data['b_time'] = this.bTime;
    data['b_status'] = this.bStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
