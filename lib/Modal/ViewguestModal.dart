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
  String? guestFloorId;
  String? guestTableId;
  String? guestSeatNo;
  String? brideOrGroom;
  String? guestRelationGroup;
  String? attendingStatus;
  String? createdAt;
  FloorName? floorName;
  TableName? tableName;
  String? accomodationLink;

  BrideGuestList(
      {this.id,
        this.uid,
        this.guestName,
        this.guestEmail,
        this.guestContact,
        this.guestFloorId,
        this.guestTableId,
        this.guestSeatNo,
        this.brideOrGroom,
        this.guestRelationGroup,
        this.attendingStatus,
        this.createdAt,
        this.floorName,
        this.tableName,
        this.accomodationLink});

  BrideGuestList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    guestName = json['guest_name'];
    guestEmail = json['guest_email'];
    guestContact = json['guest_contact'];
    guestFloorId = json['guest_floor_id'];
    guestTableId = json['guest_table_id'];
    guestSeatNo = json['guest_seat_no'];
    brideOrGroom = json['bride_or_groom'];
    guestRelationGroup = json['guest_relation_group'];
    attendingStatus = json['attending_status'];
    createdAt = json['created_at'];
    floorName = json['floorName'] != null
        ? new FloorName.fromJson(json['floorName'])
        : null;
    tableName = json['tableName'] != null
        ? new TableName.fromJson(json['tableName'])
        : null;
    accomodationLink = json['accomodationLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['guest_name'] = this.guestName;
    data['guest_email'] = this.guestEmail;
    data['guest_contact'] = this.guestContact;
    data['guest_floor_id'] = this.guestFloorId;
    data['guest_table_id'] = this.guestTableId;
    data['guest_seat_no'] = this.guestSeatNo;
    data['bride_or_groom'] = this.brideOrGroom;
    data['guest_relation_group'] = this.guestRelationGroup;
    data['attending_status'] = this.attendingStatus;
    data['created_at'] = this.createdAt;
    if (this.floorName != null) {
      data['floorName'] = this.floorName!.toJson();
    }
    if (this.tableName != null) {
      data['tableName'] = this.tableName!.toJson();
    }
    data['accomodationLink'] = this.accomodationLink;
    return data;
  }
}

class FloorName {
  String? floorName;
  String? floorCapacity;

  FloorName({this.floorName, this.floorCapacity});

  FloorName.fromJson(Map<String, dynamic> json) {
    floorName = json['floor_name'];
    floorCapacity = json['floor_capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floor_name'] = this.floorName;
    data['floor_capacity'] = this.floorCapacity;
    return data;
  }
}

class TableName {
  String? name;
  String? capacity;

  TableName({this.name, this.capacity});

  TableName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    capacity = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['capacity'] = this.capacity;
    return data;
  }
}

class GroomGuestList {
  String? id;
  String? uid;
  String? guestName;
  String? guestEmail;
  String? guestContact;
  String? guestFloorId;
  String? guestTableId;
  String? guestSeatNo;
  String? brideOrGroom;
  String? guestRelationGroup;
  String? attendingStatus;
  String? createdAt;
  FloorName? floorName;
  TableName? tableName;
  String? accomodationLink;

  GroomGuestList(
      {this.id,
        this.uid,
        this.guestName,
        this.guestEmail,
        this.guestContact,
        this.guestFloorId,
        this.guestTableId,
        this.guestSeatNo,
        this.brideOrGroom,
        this.guestRelationGroup,
        this.attendingStatus,
        this.createdAt,
        this.floorName,
        this.tableName,
        this.accomodationLink});

  GroomGuestList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    guestName = json['guest_name'];
    guestEmail = json['guest_email'];
    guestContact = json['guest_contact'];
    guestFloorId = json['guest_floor_id'];
    guestTableId = json['guest_table_id'];
    guestSeatNo = json['guest_seat_no'];
    brideOrGroom = json['bride_or_groom'];
    guestRelationGroup = json['guest_relation_group'];
    attendingStatus = json['attending_status'];
    createdAt = json['created_at'];
    floorName = json['floorName'];
    tableName = json['tableName'] != null
        ? new TableName.fromJson(json['tableName'])
        : null;
    accomodationLink = json['accomodationLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['guest_name'] = this.guestName;
    data['guest_email'] = this.guestEmail;
    data['guest_contact'] = this.guestContact;
    data['guest_floor_id'] = this.guestFloorId;
    data['guest_table_id'] = this.guestTableId;
    data['guest_seat_no'] = this.guestSeatNo;
    data['bride_or_groom'] = this.brideOrGroom;
    data['guest_relation_group'] = this.guestRelationGroup;
    data['attending_status'] = this.attendingStatus;
    data['created_at'] = this.createdAt;
    data['floorName'] = this.floorName;
    if (this.tableName != null) {
      data['tableName'] = this.tableName!.toJson();
    }
    data['accomodationLink'] = this.accomodationLink;
    return data;
  }
}
