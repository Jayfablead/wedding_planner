class HomeModal {
  String? status;
  String? message;
  UserData? userData;
  List<Services>? services;
  List<Suppliers>? suppliers;

  HomeModal(
      {this.status,
        this.message,
        this.userData,
        this.services,
        this.suppliers});

  HomeModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.suppliers != null) {
      data['suppliers'] = this.suppliers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? vid;
  String? brideName;
  String? groomName;
  String? functionDate;

  UserData(
      {this.id, this.vid, this.brideName, this.groomName, this.functionDate});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vid = json['vid'];
    brideName = json['BrideName'];
    groomName = json['GroomName'];
    functionDate = json['FunctionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vid'] = this.vid;
    data['BrideName'] = this.brideName;
    data['GroomName'] = this.groomName;
    data['FunctionDate'] = this.functionDate;
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
  String? categoryId;
  String? description;
  String? cost;
  String? fav;
  String? serviceId;
  String? service;

  Suppliers(
      {this.id,
        this.name,
        this.role,
        this.profilePath,
        this.categoryId,
        this.description,
        this.cost,
        this.fav,
        this.serviceId,
        this.service});

  Suppliers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    profilePath = json['profile_path'];
    categoryId = json['category_id'];
    description = json['description'];
    cost = json['cost'];
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
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['cost'] = this.cost;
    data['fav'] = this.fav;
    data['service_id'] = this.serviceId;
    data['service'] = this.service;
    return data;
  }
}
