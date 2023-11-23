class FloorDetalisModal {
  String? status;
  String? message;
  List<Data>? data;

  FloorDetalisModal({this.status, this.message, this.data});

  FloorDetalisModal.fromJson(Map<String, dynamic> json) {
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
  String? venueId;
  String? floorName;
  String? floorDesc;
  String? floorCapacity;
  String? floorPlan;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.venueId,
      this.floorName,
      this.floorDesc,
      this.floorCapacity,
      this.floorPlan,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueId = json['venue_id'];
    floorName = json['floor_name'];
    floorDesc = json['floor_desc'];
    floorCapacity = json['floor_capacity'];
    floorPlan = json['floor_plan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['venue_id'] = this.venueId;
    data['floor_name'] = this.floorName;
    data['floor_desc'] = this.floorDesc;
    data['floor_capacity'] = this.floorCapacity;
    data['floor_plan'] = this.floorPlan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
