class MyvenuetableModal {
  String? status;
  String? message;
  List<Data>? data;

  MyvenuetableModal({this.status, this.message, this.data});

  MyvenuetableModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? vid;
  String? name;
  String? capacity;
  String? createdAt;

  Data({this.id, this.vid, this.name, this.capacity, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vid = json['vid'];
    name = json['name'];
    capacity = json['capacity'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vid'] = this.vid;
    data['name'] = this.name;
    data['capacity'] = this.capacity;
    data['created_at'] = this.createdAt;
    return data;
  }
}
