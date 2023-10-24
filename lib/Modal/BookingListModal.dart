class BookinglistModal {
  String? status;
  String? message;
  List<Bookings>? bookings;

  BookinglistModal({this.status, this.message, this.bookings});

  BookinglistModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  String? id;
  String? supplierId;
  String? categoryId;
  String? bookingNo;
  String? bDate;
  String? bTime;
  String? bStatus;
  String? bComment;
  SupplierDetails? supplierDetails;

  Bookings(
      {this.id,
      this.supplierId,
      this.categoryId,
      this.bookingNo,
      this.bDate,
      this.bTime,
      this.bStatus,
      this.bComment,
      this.supplierDetails});

  Bookings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplierId = json['supplier_id'];
    categoryId = json['category_id'];
    bookingNo = json['booking_no'];
    bDate = json['b_date'];
    bTime = json['b_time'];
    bStatus = json['b_status'];
    bComment = json['b_comment'];
    supplierDetails = json['supplierDetails'] != null
        ? new SupplierDetails.fromJson(json['supplierDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['supplier_id'] = this.supplierId;
    data['category_id'] = this.categoryId;
    data['booking_no'] = this.bookingNo;
    data['b_date'] = this.bDate;
    data['b_time'] = this.bTime;
    data['b_status'] = this.bStatus;
    data['b_comment'] = this.bComment;
    if (this.supplierDetails != null) {
      data['supplierDetails'] = this.supplierDetails!.toJson();
    }
    return data;
  }
}

class SupplierDetails {
  String? id;
  String? name;
  String? email;
  String? profile;
  String? contact;
  String? address;
  String? description;
  Services? services;

  SupplierDetails(
      {this.id,
      this.name,
      this.email,
      this.profile,
      this.contact,
      this.address,
      this.description,
      this.services});

  SupplierDetails.fromJson(Map<String, dynamic> json) {
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
