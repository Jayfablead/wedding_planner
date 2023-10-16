class ViewguestModal {
  String? status;
  String? message;
  Guestlist? guestlist;

  ViewguestModal({this.status, this.message, this.guestlist});

  ViewguestModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    guestlist = json['guestlist'] != null
        ? new Guestlist.fromJson(json['guestlist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.guestlist != null) {
      data['guestlist'] = this.guestlist!.toJson();
    }
    return data;
  }
}

class Guestlist {
  List<BrideGuestList>? brideGuestList;
  List<GroomGuestList>? groomGuestList;

  Guestlist({this.brideGuestList, this.groomGuestList});

  Guestlist.fromJson(Map<String, dynamic> json) {
    if (json['brideGuestList'] != null) {
      brideGuestList = <BrideGuestList>[];
      json['brideGuestList'].forEach((v) {
        brideGuestList!.add(new BrideGuestList.fromJson(v));
      });
    }
    if (json['groomGuestList'] != null) {
      groomGuestList = <GroomGuestList>[];
      json['groomGuestList'].forEach((v) {
        groomGuestList!.add(new GroomGuestList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brideGuestList != null) {
      data['brideGuestList'] =
          this.brideGuestList!.map((v) => v.toJson()).toList();
    }
    if (this.groomGuestList != null) {
      data['groomGuestList'] =
          this.groomGuestList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrideGuestList {
  String? id;
  String? uid;
  String? guestName;
  String? guestEmail;
  String? guestContact;
  String? brideOrGroom;
  String? guestRelationGroup;
  String? attendingStatus;
  String? createdAt;

  BrideGuestList(
      {this.id,
        this.uid,
        this.guestName,
        this.guestEmail,
        this.guestContact,
        this.brideOrGroom,
        this.guestRelationGroup,
        this.attendingStatus,
        this.createdAt});

  BrideGuestList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    guestName = json['guest_name'];
    guestEmail = json['guest_email'];
    guestContact = json['guest_contact'];
    brideOrGroom = json['bride_or_groom'];
    guestRelationGroup = json['guest_relation_group'];
    attendingStatus = json['attending_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['guest_name'] = this.guestName;
    data['guest_email'] = this.guestEmail;
    data['guest_contact'] = this.guestContact;
    data['bride_or_groom'] = this.brideOrGroom;
    data['guest_relation_group'] = this.guestRelationGroup;
    data['attending_status'] = this.attendingStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
class GroomGuestList {
  String? id;
  String? uid;
  String? guestName;
  String? guestEmail;
  String? guestContact;
  String? brideOrGroom;
  String? guestRelationGroup;
  String? attendingStatus;
  String? createdAt;

  GroomGuestList(
      {this.id,
        this.uid,
        this.guestName,
        this.guestEmail,
        this.guestContact,
        this.brideOrGroom,
        this.guestRelationGroup,
        this.attendingStatus,
        this.createdAt});

  GroomGuestList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    guestName = json['guest_name'];
    guestEmail = json['guest_email'];
    guestContact = json['guest_contact'];
    brideOrGroom = json['bride_or_groom'];
    guestRelationGroup = json['guest_relation_group'];
    attendingStatus = json['attending_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['guest_name'] = this.guestName;
    data['guest_email'] = this.guestEmail;
    data['guest_contact'] = this.guestContact;
    data['bride_or_groom'] = this.brideOrGroom;
    data['guest_relation_group'] = this.guestRelationGroup;
    data['attending_status'] = this.attendingStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
