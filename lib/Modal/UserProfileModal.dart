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
  String? email;
  String? functionDate;

  UserDetails(
      {this.id,
      this.vid,
      this.brideName,
      this.groomName,
      this.profileImg,
      this.email,
      this.functionDate});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vid = json['vid'];
    brideName = json['BrideName'];
    groomName = json['GroomName'];
    profileImg = json['profile_img'];
    email = json['Email'];
    functionDate = json['FunctionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vid'] = this.vid;
    data['BrideName'] = this.brideName;
    data['GroomName'] = this.groomName;
    data['profile_img'] = this.profileImg;
    data['Email'] = this.email;
    data['FunctionDate'] = this.functionDate;
    return data;
  }
}
