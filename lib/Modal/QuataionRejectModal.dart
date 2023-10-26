class QuataationRejectModal {
  String? status;
  String? message;

  QuataationRejectModal({this.status, this.message});

  QuataationRejectModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
