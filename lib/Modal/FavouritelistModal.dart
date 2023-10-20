class FavouritelistModal {
  String? status;
  String? message;
  List<Myfavourites>? myfavourites;

  FavouritelistModal({this.status, this.message, this.myfavourites});

  FavouritelistModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['myfavourites'] != null) {
      myfavourites = <Myfavourites>[];
      json['myfavourites'].forEach((v) {
        myfavourites!.add(new Myfavourites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.myfavourites != null) {
      data['myfavourites'] = this.myfavourites!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Myfavourites {
  String? id;
  String? name;
  String? role;
  String? profilePath;
  String? description;
  String? type;
  String? serviceId;
  String? service;
  ServiceDetail? serviceDetail;

  Myfavourites(
      {this.id,
      this.name,
      this.role,
      this.profilePath,
      this.description,
      this.type,
      this.serviceId,
      this.service,
      this.serviceDetail});

  Myfavourites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    profilePath = json['profile_path'];
    description = json['description'];
    type = json['type'];
    serviceId = json['service_id'];
    service = json['service'];
    serviceDetail = json['serviceDetail'] != null
        ? new ServiceDetail.fromJson(json['serviceDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    data['profile_path'] = this.profilePath;
    data['description'] = this.description;
    data['type'] = this.type;
    data['service_id'] = this.serviceId;
    data['service'] = this.service;
    if (this.serviceDetail != null) {
      data['serviceDetail'] = this.serviceDetail!.toJson();
    }
    return data;
  }
}

class ServiceDetail {
  String? id;
  String? sId;
  String? categoryId;
  String? description;
  String? cost;
  String? createdAt;

  ServiceDetail(
      {this.id,
      this.sId,
      this.categoryId,
      this.description,
      this.cost,
      this.createdAt});

  ServiceDetail.fromJson(Map<String, dynamic> json) {
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
