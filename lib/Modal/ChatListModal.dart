class ChatListModal {
  String? status;
  String? message;
  Venue? venue;
  List<Suppliers>? suppliers;

  ChatListModal({this.status, this.message, this.venue, this.suppliers});

  ChatListModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    if (json['suppliers'] != null) {
      suppliers = <Suppliers>[];
      json['suppliers'].forEach((v) {
        suppliers!.add(new Suppliers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    if (this.suppliers != null) {
      data['suppliers'] = this.suppliers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Venue {
  String? id;
  String? name;
  String? profile;
  LastChatMessageInfo? lastChatMessageInfo;

  Venue({this.id, this.name, this.profile, this.lastChatMessageInfo});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profile = json['profile'];
    lastChatMessageInfo = json['lastChatMessageInfo'] != null
        ? new LastChatMessageInfo.fromJson(json['lastChatMessageInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile'] = this.profile;
    if (this.lastChatMessageInfo != null) {
      data['lastChatMessageInfo'] = this.lastChatMessageInfo!.toJson();
    }
    return data;
  }
}

class LastChatMessageInfo {
  String? id;
  String? userType;
  String? fromId;
  String? toId;
  String? messageType;
  String? message;
  String? readStatus;
  String? createdAt;

  LastChatMessageInfo(
      {this.id,
      this.userType,
      this.fromId,
      this.toId,
      this.messageType,
      this.message,
      this.readStatus,
      this.createdAt});

  LastChatMessageInfo.fromJson(Map<String, dynamic> json) {
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

class Suppliers {
  String? id;
  String? name;
  String? role;
  String? profile;
  LastChatMessageInfo? lastChatMessageInfo1;

  Suppliers(
      {this.id, this.name, this.role, this.profile, this.lastChatMessageInfo1});

  Suppliers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    profile = json['profile'];
    lastChatMessageInfo1 = json['lastChatMessageInfo1'] != null
        ? new LastChatMessageInfo.fromJson(json['lastChatMessageInfo1'])
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
