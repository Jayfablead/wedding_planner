class AddTopicModal {
  String? status;
  String? message;
  Data? data;

  AddTopicModal({this.status, this.message, this.data});

  AddTopicModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? role;
  int? topicId;
  String? profile;

  Data({this.userId, this.role, this.topicId, this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    role = json['role'];
    topicId = json['topic_id'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['role'] = this.role;
    data['topic_id'] = this.topicId;
    data['profile'] = this.profile;
    return data;
  }
}
