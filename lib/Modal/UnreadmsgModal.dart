class UnreadmsgModal {
  String? status;
  String? message;
  int? remainToread;

  UnreadmsgModal({this.status, this.message, this.remainToread});

  UnreadmsgModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    remainToread = json['remainToread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['remainToread'] = this.remainToread;
    return data;
  }
}
