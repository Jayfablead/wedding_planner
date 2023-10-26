// {
// "status": "1",
// "message": "Quotation Details.",
// "details": {
// "uid": "17",
// "s_id": "102",
// "c_id": "3",
// "res_details": "This is the response of first quotatation",
// "total_amount": "5000",
// "deposit_amount": "850",
// "status": "0",
// "booking_amt": "4150",
// "supplier": {
// "id": "102",
// "profile": "https://wedding.fableadtechnolabs.com/wedding/portal/public/assets/img/profile/1696593418_fc7576e115c21bafce5c.png",
// "email": "supplier2@gmail.com",
// "name": "Supplier2",
// "category_name": "flourist",
// "description": "I am Flourist. And I have excellent team to decor stage,winfdows,marriage hall"
// }
// }
// }

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
    data['is_booked'] = this.isBooked;
    return data;
  }
}

class Supplier {
  String? id;
  String? profile;
  String? email;
  String? name;
  String? categoryName;
  String? description;

  Supplier(
      {this.id,
        this.profile,
        this.email,
        this.name,
        this.categoryName,
        this.description});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = json['profile'];
    email = json['email'];
    name = json['name'];
    categoryName = json['category_name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profile'] = this.profile;
    data['email'] = this.email;
    data['name'] = this.name;
    data['category_name'] = this.categoryName;
    data['description'] = this.description;
    return data;
  }
}
