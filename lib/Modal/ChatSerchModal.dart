class ChatSerchModal {
  String? status;
  String? message;
  List<Data>? data;

  ChatSerchModal({this.status, this.message, this.data});

  ChatSerchModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? role;
  String? profile;
  LastChatMessageInfo1? lastChatMessageInfo1;

  Data(
      {this.id, this.name, this.role, this.profile, this.lastChatMessageInfo1});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    profile = json['profile'];
    lastChatMessageInfo1 = json['lastChatMessageInfo1'] != null
        ? new LastChatMessageInfo1.fromJson(json['lastChatMessageInfo1'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    data['profile'] = this.profile;
    if (this.lastChatMessageInfo1 != null) {
      data['lastChatMessageInfo1'] = this.lastChatMessageInfo1!.toJson();
    }
    return data;
  }
}

class LastChatMessageInfo1 {
  String? id;
  String? userType;
  String? fromId;
  String? toId;
  String? messageType;
  String? message;
  String? readStatus;
  String? createdAt;

  LastChatMessageInfo1(
      {this.id,
        this.userType,
        this.fromId,
        this.toId,
        this.messageType,
        this.message,
        this.readStatus,
        this.createdAt});

  LastChatMessageInfo1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    fromId = json['from_id'];
    toId = json['to_id'];
    messageType = json['message_type'];
    message = json['message'];
    readStatus = json['read_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_type'] = this.userType;
    data['from_id'] = this.fromId;
    data['to_id'] = this.toId;
    data['message_type'] = this.messageType;
    data['message'] = this.message;
    data['read_status'] = this.readStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
