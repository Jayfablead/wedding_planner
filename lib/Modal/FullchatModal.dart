class FullchatModal {
  String? status;
  String? message;
  Data? data;

  FullchatModal({this.status, this.message, this.data});

  FullchatModal.fromJson(Map<String, dynamic> json) {
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
  ChatUser? chatUser;
  List<Livechat>? livechat;

  Data({this.chatUser, this.livechat});

  Data.fromJson(Map<String, dynamic> json) {
    chatUser = json['chatUser'] != null
        ? new ChatUser.fromJson(json['chatUser'])
        : null;
    if (json['livechat'] != null) {
      livechat = <Livechat>[];
      json['livechat'].forEach((v) {
        livechat!.add(new Livechat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chatUser != null) {
      data['chatUser'] = this.chatUser!.toJson();
    }
    if (this.livechat != null) {
      data['livechat'] = this.livechat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatUser {
  String? id;
  String? name;
  String? email;
  String? profile;

  ChatUser({this.id, this.name, this.email, this.profile});

  ChatUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile'] = this.profile;
    return data;
  }
}

class Livechat {
  String? id;
  String? userType;
  String? fromId;
  String? toId;
  String? messageType;
  String? message;
  String? readStatus;
  String? createdAt;

  Livechat(
      {this.id,
        this.userType,
        this.fromId,
        this.toId,
        this.messageType,
        this.message,
        this.readStatus,
        this.createdAt});

  Livechat.fromJson(Map<String, dynamic> json) {
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
