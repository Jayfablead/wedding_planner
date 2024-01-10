class SetingcModal {
  String? status;
  String? message;
  List<SuppliersDetails>? suppliersDetails;

  SetingcModal({this.status, this.message, this.suppliersDetails});

  SetingcModal.fromJson(Map<String, dynamic> json) {
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
  Floor? floor;

  SuppliersDetails({this.floor});

  SuppliersDetails.fromJson(Map<String, dynamic> json) {
    floor = json['floor'] != null ? new Floor.fromJson(json['floor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.floor != null) {
      data['floor'] = this.floor!.toJson();
    }
    return data;
  }
}

class Floor {
  String? id;
  String? venueId;
  String? floorName;
  String? floorDesc;
  String? floorCapacity;
  String? floorPlan;
  String? createdAt;
  String? updatedAt;
  List<Tables>? tables;

  Floor(
      {this.id,
      this.venueId,
      this.floorName,
      this.floorDesc,
      this.floorCapacity,
      this.floorPlan,
      this.createdAt,
      this.updatedAt,
      this.tables});

  Floor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueId = json['venue_id'];
    floorName = json['floor_name'];
    floorDesc = json['floor_desc'];
    floorCapacity = json['floor_capacity'];
    floorPlan = json['floor_plan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['tables'] != null) {
      tables = <Tables>[];
      json['tables'].forEach((v) {
        tables!.add(new Tables.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['venue_id'] = this.venueId;
    data['floor_name'] = this.floorName;
    data['floor_desc'] = this.floorDesc;
    data['floor_capacity'] = this.floorCapacity;
    data['floor_plan'] = this.floorPlan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.tables != null) {
      data['tables'] = this.tables!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tables {
  Table? table;
  List<GuestList>? guestList;

  Tables({this.table, this.guestList});

  Tables.fromJson(Map<String, dynamic> json) {
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
  String? vFloorId;
  String? name;
  String? capacity;
  String? tType;
  String? createdAt;

  Table(
      {this.id,
      this.vid,
      this.vFloorId,
      this.name,
      this.capacity,
      this.tType,
      this.createdAt});

  Table.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vid = json['vid'];
    vFloorId = json['v_floor_id'];
    name = json['name'];
    capacity = json['capacity'];
    tType = json['t_type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vid'] = this.vid;
    data['v_floor_id'] = this.vFloorId;
    data['name'] = this.name;
    data['capacity'] = this.capacity;
    data['t_type'] = this.tType;
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
  String? guestFloorId;
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
      this.guestFloorId,
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
    guestFloorId = json['guest_floor_id'];
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
    data['guest_floor_id'] = this.guestFloorId;
    data['guest_table_id'] = this.guestTableId;
    data['guest_seat_no'] = this.guestSeatNo;
    data['bride_or_groom'] = this.brideOrGroom;
    data['guest_relation_group'] = this.guestRelationGroup;
    data['attending_status'] = this.attendingStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
