class UnreadnotiModal {
  String? status;
  String? message;
  int? unreadNoti;

  UnreadnotiModal({this.status, this.message, this.unreadNoti});

  UnreadnotiModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    unreadNoti = json['unreadNoti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['unreadNoti'] = this.unreadNoti;
    return data;
  }
}
