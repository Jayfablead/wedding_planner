class QouteDetailsModal {
  String? status;
  String? message;
  Details? details;

  QouteDetailsModal({this.status, this.message, this.details});

  QouteDetailsModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  String? uid;
  String? sId;
  String? cId;
  String? qComment;
  String? resDetails;
  String? totalAmount;
  String? depositAmount;
  String? status;
  String? bookingAmt;
  Supplier? supplier;
  List<String>? images;
  String? isBooked;

  Details(
      {this.uid,
      this.sId,
      this.cId,
      this.qComment,
      this.resDetails,
      this.totalAmount,
      this.depositAmount,
      this.status,
      this.bookingAmt,
      this.supplier,
      this.images,
      this.isBooked});

  Details.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    sId = json['s_id'];
    cId = json['c_id'];
    qComment = json['q_comment'];
    resDetails = json['res_details'];
    totalAmount = json['total_amount'];
    depositAmount = json['deposit_amount'];
    status = json['status'];
    bookingAmt = json['booking_amt'];
    supplier = json['supplier'] != null
        ? new Supplier.fromJson(json['supplier'])
        : null;
    images = json['images'].cast<String>();
    isBooked = json['is_booked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['s_id'] = this.sId;
    data['c_id'] = this.cId;
    data['q_comment'] = this.qComment;
    data['res_details'] = this.resDetails;
    data['total_amount'] = this.totalAmount;
    data['deposit_amount'] = this.depositAmount;
    data['status'] = this.status;
    data['booking_amt'] = this.bookingAmt;
    if (this.supplier != null) {
      data['supplier'] = this.supplier!.toJson();
    }
    data['images'] = this.images;
    data['is_booked'] = this.isBooked;
    return data;
  }
}

class Supplier {
  String? id;
  String? profile;
  String? email;
  String? name;
  String? servicePhotos;
  String? categoryName;
  String? description;

  Supplier(
      {this.id,
      this.profile,
      this.email,
      this.name,
      this.servicePhotos,
      this.categoryName,
      this.description});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = json['profile'];
    email = json['email'];
    name = json['name'];
    servicePhotos = json['service_photos'];
    categoryName = json['category_name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profile'] = this.profile;
    data['email'] = this.email;
    data['name'] = this.name;
    data['service_photos'] = this.servicePhotos;
    data['category_name'] = this.categoryName;
    data['description'] = this.description;
    return data;
  }
}
