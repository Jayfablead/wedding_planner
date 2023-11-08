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
  String? id;
  String? venueId;
  String? supplierId;
  String? catgId;
  String? brideGroomId;
  String? eventDate;
  String? dueDate;
  String? invoiceNo;
  String? guestCount;
  String? contactName;
  String? contactEmail;
  String? contactPhone;
  String? servicesInfo;
  String? invAmt;
  String? additionalNotes;
  String? invFile;
  String? bookingStatus;
  String? createdAt;
  SupplierDetails? supplierDetails;

  Invoices(
      {this.id,
        this.venueId,
        this.supplierId,
        this.catgId,
        this.brideGroomId,
        this.eventDate,
        this.dueDate,
        this.invoiceNo,
        this.guestCount,
        this.contactName,
        this.contactEmail,
        this.contactPhone,
        this.servicesInfo,
        this.invAmt,
        this.additionalNotes,
        this.invFile,
        this.bookingStatus,
        this.createdAt,
        this.supplierDetails});

  Invoices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueId = json['venue_id'];
    supplierId = json['supplier_id'];
    catgId = json['catg_id'];
    brideGroomId = json['bride_groom_id'];
    eventDate = json['event_date'];
    dueDate = json['due_date'];
    invoiceNo = json['invoice_no'];
    guestCount = json['guest_count'];
    contactName = json['contact_name'];
    contactEmail = json['contact_email'];
    contactPhone = json['contact_phone'];
    servicesInfo = json['services_info'];
    invAmt = json['inv_amt'];
    additionalNotes = json['additional_notes'];
    invFile = json['inv_file'];
    bookingStatus = json['booking_status'];
    createdAt = json['created_at'];
    supplierDetails = json['supplierDetails'] != null
        ? new SupplierDetails.fromJson(json['supplierDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['venue_id'] = this.venueId;
    data['supplier_id'] = this.supplierId;
    data['catg_id'] = this.catgId;
    data['bride_groom_id'] = this.brideGroomId;
    data['event_date'] = this.eventDate;
    data['due_date'] = this.dueDate;
    data['invoice_no'] = this.invoiceNo;
    data['guest_count'] = this.guestCount;
    data['contact_name'] = this.contactName;
    data['contact_email'] = this.contactEmail;
    data['contact_phone'] = this.contactPhone;
    data['services_info'] = this.servicesInfo;
    data['inv_amt'] = this.invAmt;
    data['additional_notes'] = this.additionalNotes;
    data['inv_file'] = this.invFile;
    data['booking_status'] = this.bookingStatus;
    data['created_at'] = this.createdAt;
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
  String? servicePhotos;
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
        this.servicePhotos,
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
    servicePhotos = json['service_photos'];
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
    data['service_photos'] = this.servicePhotos;
    data['description'] = this.description;
    data['cost'] = this.cost;
    data['created_at'] = this.createdAt;
    data['category_icon'] = this.categoryIcon;
    data['category_name'] = this.categoryName;
    data['category_desc'] = this.categoryDesc;
    return data;
  }
}
