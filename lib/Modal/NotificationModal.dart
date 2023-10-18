class NotificationModal {
  String? status;
  String? message;
  List<NotiDetails>? notiDetails;

  NotificationModal({this.status, this.message, this.notiDetails});

  NotificationModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['notiDetails'] != null) {
      notiDetails = <NotiDetails>[];
      json['notiDetails'].forEach((v) {
        notiDetails!.add(new NotiDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.notiDetails != null) {
      data['notiDetails'] = this.notiDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotiDetails {
  String? id;
  String? uid;
  String? bridegroomId;
  String? notiTitle;
  String? notiBody;
  String? readStatus;
  String? createdAt;

  NotiDetails(
      {this.id,
        this.uid,
        this.bridegroomId,
        this.notiTitle,
        this.notiBody,
        this.readStatus,
        this.createdAt});

  NotiDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    bridegroomId = json['bridegroom_id'];
    notiTitle = json['noti_title'];
    notiBody = json['noti_body'];
    readStatus = json['read_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['bridegroom_id'] = this.bridegroomId;
    data['noti_title'] = this.notiTitle;
    data['noti_body'] = this.notiBody;
    data['read_status'] = this.readStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
