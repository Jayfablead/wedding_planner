class UserModal {
  String? status;
  String? message;
  User? user;

  UserModal({this.status, this.message, this.user});

  UserModal.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? vid;
  String? brideName;
  String? groomName;
  String? email;
  String? profilePath;

  User(
      {this.id,
      this.vid,
      this.brideName,
      this.groomName,
      this.email,
      this.profilePath});

  User.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    vid = json['vid'];
    brideName = json['BrideName'];
    groomName = json['GroomName'];
    email = json['Email'];
    profilePath = json['profile_path'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['vid'] = this.vid;
    data['BrideName'] = this.brideName;
    data['GroomName'] = this.groomName;
    data['Email'] = this.email;
    data['profile_path'] = this.profilePath;
    return data;
  }
}
