class VenuedetailModal {
  String? status;
  String? message;
  VenueDetails? venueDetails;

  VenuedetailModal({this.status, this.message, this.venueDetails});

  VenuedetailModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    venueDetails = json['venueDetails'] != null
        ? new VenueDetails.fromJson(json['venueDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.venueDetails != null) {
      data['venueDetails'] = this.venueDetails!.toJson();
    }
    return data;
  }
}

class VenueDetails {
  String? id;
  String? name;
  String? email;
  String? contact;
  String? profile;
  MoreInfo? moreInfo;

  VenueDetails(
      {this.id,
        this.name,
        this.email,
        this.contact,
        this.profile,
        this.moreInfo});

  VenueDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    profile = json['profile'];
    moreInfo = json['moreInfo'] != null
        ? new MoreInfo.fromJson(json['moreInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['profile'] = this.profile;
    if (this.moreInfo != null) {
      data['moreInfo'] = this.moreInfo!.toJson();
    }
    return data;
  }
}

class MoreInfo {
  String? id;
  String? uid;
  String? address;
  List<String>? photos;
  String? vCapacity;
  String? vDetails;
  String? createdAt;

  MoreInfo(
      {this.id,
        this.uid,
        this.address,
        this.photos,
        this.vCapacity,
        this.vDetails,
        this.createdAt});

  MoreInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    address = json['address'];
    photos = json['photos'].cast<String>();
    vCapacity = json['v_capacity'];
    vDetails = json['v_details'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['address'] = this.address;
    data['photos'] = this.photos;
    data['v_capacity'] = this.vCapacity;
    data['v_details'] = this.vDetails;
    data['created_at'] = this.createdAt;
    return data;
  }
}
