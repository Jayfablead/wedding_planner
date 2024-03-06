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
  String? uid;
  String? vName;
  String? address;
  String? subscriptionRenewal;
  String? vid;
  String? coupleEmail;
  MoreInfo? moreInfo;

  VenueDetails(
      {this.id,
      this.name,
      this.email,
      this.contact,
      this.profile,
      this.uid,
      this.vName,
      this.address,
      this.subscriptionRenewal,
      this.vid,
      this.coupleEmail,
      this.moreInfo});

  VenueDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    profile = json['profile'];
    uid = json['uid'];
    vName = json['v_name'];
    address = json['address'];
    subscriptionRenewal = json['subscription_renewal'];
    vid = json['vid'];
    coupleEmail = json['couple_email'];
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
    data['uid'] = this.uid;
    data['v_name'] = this.vName;
    data['address'] = this.address;
    data['subscription_renewal'] = this.subscriptionRenewal;
    data['vid'] = this.vid;
    data['couple_email'] = this.coupleEmail;
    if (this.moreInfo != null) {
      data['moreInfo'] = this.moreInfo!.toJson();
    }
    return data;
  }
}

class MoreInfo {
  String? id;
  String? uid;
  String? vName;
  String? address;
  String? subscriptionRenewal;
  String? photos;
  String? vCapacity;
  String? vDetails;
  String? loadingUnloading;
  String? parkingInfo;
  String? furnitureInfo;
  String? kitchenBarInfo;
  String? soundInfo;
  String? safetyInfo;
  String? supplierAccess;
  String? guestAccess;
  String? riggingAllowed;
  String? onsiteAccomodation;
  String? createdAt;

  MoreInfo(
      {this.id,
      this.uid,
      this.vName,
      this.address,
      this.subscriptionRenewal,
      this.photos,
      this.vCapacity,
      this.vDetails,
      this.loadingUnloading,
      this.parkingInfo,
      this.furnitureInfo,
      this.kitchenBarInfo,
      this.soundInfo,
      this.safetyInfo,
      this.supplierAccess,
      this.guestAccess,
      this.riggingAllowed,
      this.onsiteAccomodation,
      this.createdAt});

  MoreInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    vName = json['v_name'];
    address = json['address'];
    subscriptionRenewal = json['subscription_renewal'];
    photos = json['photos'];
    vCapacity = json['v_capacity'];
    vDetails = json['v_details'];
    loadingUnloading = json['loading_unloading'];
    parkingInfo = json['parking_info'];
    furnitureInfo = json['furniture_info'];
    kitchenBarInfo = json['kitchen_bar_info'];
    soundInfo = json['sound_info'];
    safetyInfo = json['safety_info'];
    supplierAccess = json['supplier_access'];
    guestAccess = json['guest_access'];
    riggingAllowed = json['rigging_allowed'];
    onsiteAccomodation = json['onsite_accomodation'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['v_name'] = this.vName;
    data['address'] = this.address;
    data['subscription_renewal'] = this.subscriptionRenewal;
    data['photos'] = this.photos;
    data['v_capacity'] = this.vCapacity;
    data['v_details'] = this.vDetails;
    data['loading_unloading'] = this.loadingUnloading;
    data['parking_info'] = this.parkingInfo;
    data['furniture_info'] = this.furnitureInfo;
    data['kitchen_bar_info'] = this.kitchenBarInfo;
    data['sound_info'] = this.soundInfo;
    data['safety_info'] = this.safetyInfo;
    data['supplier_access'] = this.supplierAccess;
    data['guest_access'] = this.guestAccess;
    data['rigging_allowed'] = this.riggingAllowed;
    data['onsite_accomodation'] = this.onsiteAccomodation;
    data['created_at'] = this.createdAt;
    return data;
  }
}
