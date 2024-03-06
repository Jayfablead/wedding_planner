class HomeModal {
  String? status;
  String? message;
  List<Services>? services;
  List<Suppliers>? suppliers;
  Events? events;

  HomeModal(
      {this.status, this.message, this.services, this.suppliers, this.events});

  HomeModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    if (json['suppliers'] != null) {
      suppliers = <Suppliers>[];
      json['suppliers'].forEach((v) {
        suppliers!.add(new Suppliers.fromJson(v));
      });
    }
    events =
    json['events'] != null ? new Events.fromJson(json['events']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.suppliers != null) {
      data['suppliers'] = this.suppliers!.map((v) => v.toJson()).toList();
    }
    if (this.events != null) {
      data['events'] = this.events!.toJson();
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

  Services(
      {this.categoryId,
        this.categoryIcon,
        this.categoryName,
        this.categoryDesc,
        this.createdAt});

  Services.fromJson(Map<String, dynamic> json) {
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

class Suppliers {
  String? id;
  String? name;
  String? role;
  String? profilePath;
  String? servicePhotos; // Adjusted type
  String? categoryId;
  String? description;
  String? cost;
  List<String>? images;
  String? fav;
  String? serviceId;
  String? service;

  Suppliers(
      {this.id,
        this.name,
        this.role,
        this.profilePath,
        this.servicePhotos,
        this.categoryId,
        this.description,
        this.cost,
        this.images,
        this.fav,
        this.serviceId,
        this.service});

  Suppliers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    profilePath = json['profile_path'];
    servicePhotos = json['service_photos'];
    categoryId = json['category_id'];
    description = json['description'];
    cost = json['cost'];
    images = json['images'].cast<String>();
    fav = json['fav'];
    serviceId = json['service_id'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    data['profile_path'] = this.profilePath;
    data['service_photos'] = this.servicePhotos;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['cost'] = this.cost;
    data['images'] = this.images;
    data['fav'] = this.fav;
    data['service_id'] = this.serviceId;
    data['service'] = this.service;
    return data;
  }
}

class Events {
  String? eventId;
  String? eventType;
  String? eventDate;
  String? brideName;
  String? groomName;
  List<String>? companyNames;

  Events(
      {this.eventId,
        this.eventType,
        this.eventDate,
        this.brideName,
        this.groomName,
        this.companyNames});

  Events.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventType = json['event_type'];
    eventDate = json['event_date'];
    brideName = json['bride_name'];
    groomName = json['groom_name'];
    companyNames = json['company_names'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['event_type'] = this.eventType;
    data['event_date'] = this.eventDate;
    data['bride_name'] = this.brideName;
    data['groom_name'] = this.groomName;
    data['company_names'] = this.companyNames;
    return data;
  }
}
