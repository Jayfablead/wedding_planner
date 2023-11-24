class SuppliersearchModal {
  String? status;
  String? message;
  UserData? userData;
  List<Suppliers>? suppliers;

  SuppliersearchModal(
      {this.status, this.message, this.userData, this.suppliers});

  SuppliersearchModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
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

class Suppliers {
  String? id;
  String? name;
  String? role;
  String? profilePath;
  String? servicePhotos;
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
