class UserProfileModal {
  String? status;
  String? message;
  UserDetails? userDetails;

  UserProfileModal({this.status, this.message, this.userDetails});

  UserProfileModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userDetails = json['userDetails'] != null
        ? new UserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  String? id;
  String? vid;
  String? brideName;
  String? groomName;
  String? profileImg;
  String? phone;
  String? address;
  String? email;
  String? functionDate;
  String? quotationReq;
  String? bookingReq;

  UserDetails(
      {this.id,
      this.vid,
      this.brideName,
      this.groomName,
      this.profileImg,
      this.phone,
      this.address,
      this.email,
      this.functionDate,
      this.quotationReq,
      this.bookingReq});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vid = json['vid'];
    brideName = json['BrideName'];
    groomName = json['GroomName'];
    profileImg = json['profile_img'];
    phone = json['phone'];
    address = json['address'];
    email = json['Email'];
    functionDate = json['FunctionDate'];
    quotationReq = json['quotationReq'];
    bookingReq = json['bookingReq'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vid'] = this.vid;
    data['BrideName'] = this.brideName;
    data['GroomName'] = this.groomName;
    data['profile_img'] = this.profileImg;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['Email'] = this.email;
    data['FunctionDate'] = this.functionDate;
    data['quotationReq'] = this.quotationReq;
    data['bookingReq'] = this.bookingReq;
    return data;
  }
}
