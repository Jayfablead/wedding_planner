class BookNowModal {
  String? status;
  String? message;
  String? bID;

  BookNowModal({this.status, this.message, this.bID});

  BookNowModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    bID = json['b_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['b_ID'] = this.bID;
    return data;
  }
}
