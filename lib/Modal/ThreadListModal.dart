class ThreadListModal {
  String? status;
  String? message;
  Data? data;

  ThreadListModal({this.status, this.message, this.data});

  ThreadListModal.fromJson(Map<String, dynamic> json) {
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
  List<TopicDetails>? topicDetails;

  Data({this.userId, this.topicDetails});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    if (json['topic_details'] != null) {
      topicDetails = <TopicDetails>[];
      json['topic_details'].forEach((v) {
        topicDetails!.add(new TopicDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    if (this.topicDetails != null) {
      data['topic_details'] =
          this.topicDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopicDetails {
  String? id;
  String? memberId;
  String? createdById;
  String? userType;
  String? topicTitle;
  String? createdByType;
  String? createdAt;
  MemberProfile? memberProfile;

  TopicDetails(
      {this.id,
        this.memberId,
        this.createdById,
        this.userType,
        this.topicTitle,
        this.createdByType,
        this.createdAt,
        this.memberProfile});

  TopicDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    createdById = json['created_by_id'];
    userType = json['user_type'];
    topicTitle = json['topic_title'];
    createdByType = json['created_by_type'];
    createdAt = json['created_at'];
    memberProfile = json['member_profile'] != null
        ? new MemberProfile.fromJson(json['member_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['created_by_id'] = this.createdById;
    data['user_type'] = this.userType;
    data['topic_title'] = this.topicTitle;
    data['created_by_type'] = this.createdByType;
    data['created_at'] = this.createdAt;
    if (this.memberProfile != null) {
      data['member_profile'] = this.memberProfile!.toJson();
    }
    return data;
  }
}

class MemberProfile {
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  String? supplierApprovalStatus;
  String? profile;
  String? contact;
  String? forgotPassKey;
  String? createdAt;

  MemberProfile(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.role,
        this.supplierApprovalStatus,
        this.profile,
        this.contact,
        this.forgotPassKey,
        this.createdAt});

  MemberProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    supplierApprovalStatus = json['supplier_approval_status'];
    profile = json['profile'];
    contact = json['contact'];
    forgotPassKey = json['forgot_pass_key'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    data['supplier_approval_status'] = this.supplierApprovalStatus;
    data['profile'] = this.profile;
    data['contact'] = this.contact;
    data['forgot_pass_key'] = this.forgotPassKey;
    data['created_at'] = this.createdAt;
    return data;
  }
}
