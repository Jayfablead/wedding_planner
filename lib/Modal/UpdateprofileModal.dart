class UpdateprofileModal {
  String? status;
  String? message;
  bool? userDetails;

  UpdateprofileModal({this.status, this.message, this.userDetails});

  UpdateprofileModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userDetails = json['userDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['userDetails'] = this.userDetails;
    return data;
  }
}
