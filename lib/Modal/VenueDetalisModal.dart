class VenueDetalisModal {
  String? status;
  String? message;
  Data? data;

  VenueDetalisModal({this.status, this.message, this.data});

  VenueDetalisModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  Venue? venue;

  Data(
      {this.id,
      this.venueId,
      this.floorName,
      this.floorDesc,
      this.floorCapacity,
      this.floorPlan,
      this.createdAt,
      this.updatedAt,
      this.venue});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueId = json['venue_id'];
    floorName = json['floor_name'];
    floorDesc = json['floor_desc'];
    floorCapacity = json['floor_capacity'];
    floorPlan = json['floor_plan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
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
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    return data;
  }
}

class Venue {
  String? id;
  String? uid;
  String? vName;
  String? address;
  String? photos;
  String? vCapacity;
  String? vDetails;
  String? createdAt;

  Venue(
      {this.id,
      this.uid,
      this.vName,
      this.address,
      this.photos,
      this.vCapacity,
      this.vDetails,
      this.createdAt});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    vName = json['v_name'];
    address = json['address'];
    photos = json['photos'];
    vCapacity = json['v_capacity'];
    vDetails = json['v_details'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['v_name'] = this.vName;
    data['address'] = this.address;
    data['photos'] = this.photos;
    data['v_capacity'] = this.vCapacity;
    data['v_details'] = this.vDetails;
    data['created_at'] = this.createdAt;
    return data;
  }
}
