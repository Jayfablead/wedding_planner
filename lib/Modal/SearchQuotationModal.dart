class SearchQuotationModal {
  String? status;
  String? message;
  All? all;

  SearchQuotationModal({this.status, this.message, this.all});

  SearchQuotationModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    all = json['all'] != null ? new All.fromJson(json['all']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.all != null) {
      data['all'] = this.all!.toJson();
    }
    return data;
  }
}

class All {
  List<Responsed>? responsed;

  All({this.responsed});

  All.fromJson(Map<String, dynamic> json) {
    if (json['responsed'] != null) {
      responsed = <Responsed>[];
      json['responsed'].forEach((v) {
        responsed!.add(new Responsed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responsed != null) {
      data['responsed'] = this.responsed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Responsed {
  String? id;
  String? profile;
  String? name;
  String? categoryName;
  String? description;
  String? quotationId;
  bool? response;
  String? createdAt;

  Responsed(
      {this.id,
        this.profile,
        this.name,
        this.categoryName,
        this.description,
        this.quotationId,
        this.response,
        this.createdAt});

  Responsed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = json['profile'];
    name = json['name'];
    categoryName = json['category_name'];
    description = json['description'];
    quotationId = json['quotationId'];
    response = json['response'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profile'] = this.profile;
    data['name'] = this.name;
    data['category_name'] = this.categoryName;
    data['description'] = this.description;
    data['quotationId'] = this.quotationId;
    data['response'] = this.response;
    data['created_at'] = this.createdAt;
    return data;
  }
}
