class Invoicelistmodal {
  String? status;
  String? message;
  List<Invoices>? invoices;

  Invoicelistmodal({this.status, this.message, this.invoices});

  Invoicelistmodal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['invoices'] != null) {
      invoices = <Invoices>[];
      json['invoices'].forEach((v) {
        invoices!.add(new Invoices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.invoices != null) {
      data['invoices'] = this.invoices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Invoices {
  String? invId;
  String? userId;
  String? supplierId;
  String? catId;
  String? invoiceDate;
  String? dueDate;
  String? invoiceTotalAmt;
  String? payStatus;
  String? payMethod;
  String? invFile;
  String? createdAt;
  String? updatedAt;
  SupplierDetails? supplierDetails;

  Invoices(
      {this.invId,
      this.userId,
      this.supplierId,
      this.catId,
      this.invoiceDate,
      this.dueDate,
      this.invoiceTotalAmt,
      this.payStatus,
      this.payMethod,
      this.invFile,
      this.createdAt,
      this.updatedAt,
      this.supplierDetails});

  Invoices.fromJson(Map<String, dynamic> json) {
    invId = json['inv_id'];
    userId = json['user_id'];
    supplierId = json['supplier_id'];
    catId = json['cat_id'];
    invoiceDate = json['invoice_date'];
    dueDate = json['due_date'];
    invoiceTotalAmt = json['invoice_total_amt'];
    payStatus = json['pay_status'];
    payMethod = json['pay_method'];
    invFile = json['inv_file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    supplierDetails = json['supplierDetails'] != null
        ? new SupplierDetails.fromJson(json['supplierDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inv_id'] = this.invId;
    data['user_id'] = this.userId;
    data['supplier_id'] = this.supplierId;
    data['cat_id'] = this.catId;
    data['invoice_date'] = this.invoiceDate;
    data['due_date'] = this.dueDate;
    data['invoice_total_amt'] = this.invoiceTotalAmt;
    data['pay_status'] = this.payStatus;
    data['pay_method'] = this.payMethod;
    data['inv_file'] = this.invFile;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
