class GuestseatingModal {
  String? status;
  String? message;
  List<SuppliersDetails>? suppliersDetails;

  GuestseatingModal({this.status, this.message, this.suppliersDetails});

  GuestseatingModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['suppliersDetails'] != null) {
      suppliersDetails = <SuppliersDetails>[];
      json['suppliersDetails'].forEach((v) {
        suppliersDetails!.add(new SuppliersDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.suppliersDetails != null) {
      data['suppliersDetails'] =
          this.suppliersDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SuppliersDetails {
  Table? table;
  List<GuestList>? guestList;

  SuppliersDetails({this.table, this.guestList});

  SuppliersDetails.fromJson(Map<String, dynamic> json) {
    table = json['table'] != null ? new Table.fromJson(json['table']) : null;
    if (json['guestList'] != null) {
      guestList = <GuestList>[];
      json['guestList'].forEach((v) {
        guestList!.add(new GuestList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.table != null) {
      data['table'] = this.table!.toJson();
    }
    if (this.guestList != null) {
      data['guestList'] = this.guestList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table {
  String? id;
  String? vid;
  String? name;
  String? capacity;
  String? createdAt;

  Table({this.id, this.vid, this.name, this.capacity, this.createdAt});

  Table.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vid = json['vid'];
    name = json['name'];
    capacity = json['capacity'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vid'] = this.vid;
    data['name'] = this.name;
    data['capacity'] = this.capacity;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class GuestList {
  String? id;
  String? uid;
  String? guestName;
  String? guestEmail;
  String? guestContact;
  String? guestTableId;
  String? guestSeatNo;
  String? brideOrGroom;
  String? guestRelationGroup;
  String? attendingStatus;
  String? createdAt;

  GuestList(
      {this.id,
        this.uid,
        this.guestName,
        this.guestEmail,
        this.guestContact,
        this.guestTableId,
        this.guestSeatNo,
        this.brideOrGroom,
        this.guestRelationGroup,
        this.attendingStatus,
        this.createdAt});

  GuestList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    guestName = json['guest_name'];
    guestEmail = json['guest_email'];
    guestContact = json['guest_contact'];
    guestTableId = json['guest_table_id'];
    guestSeatNo = json['guest_seat_no'];
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
    data['guest_table_id'] = this.guestTableId;
    data['guest_seat_no'] = this.guestSeatNo;
    data['bride_or_groom'] = this.brideOrGroom;
    data['guest_relation_group'] = this.guestRelationGroup;
    data['attending_status'] = this.attendingStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
