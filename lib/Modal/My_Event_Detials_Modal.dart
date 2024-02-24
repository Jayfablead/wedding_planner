class My_Event_Details_Modal {
  String? status;
  String? message;
  EventDetails? eventDetails;

  My_Event_Details_Modal({this.status, this.message, this.eventDetails});

  My_Event_Details_Modal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    eventDetails = json['eventDetails'] != null
        ? new EventDetails.fromJson(json['eventDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.eventDetails != null) {
      data['eventDetails'] = this.eventDetails!.toJson();
    }
    return data;
  }
}

class EventDetails {
  String? eventId;
  String? vid;
  String? eventType;
  String? eventName;
  String? guests;
  String? datesOfEvent;
  String? billingAddress;
  String? postCode;
  List<TeamMembers>? teamMembers;
  EventGroupId? eventGroupId;
  List<EventSpaceIds>? eventSpaceIds;
  String? coupleEmail;
  String? createdAt;
  String? id;
  String? brideName;
  String? groomName;
  String? functionDate;
  String? profileImg;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? forgotPassKey;
  String? budget;
  String? finalCost;
  String? createdt;
  List<EventCompanies>? eventCompanies;
  List<EventContacts>? eventContacts;
  List<EventCouples>? eventCouples;

  EventDetails(
      {this.eventId,
      this.vid,
      this.eventType,
      this.eventName,
      this.guests,
      this.datesOfEvent,
      this.billingAddress,
      this.postCode,
      this.teamMembers,
      this.eventGroupId,
      this.eventSpaceIds,
      this.coupleEmail,
      this.createdAt,
      this.id,
      this.brideName,
      this.groomName,
      this.functionDate,
      this.profileImg,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.forgotPassKey,
      this.budget,
      this.finalCost,
      this.createdt,
      this.eventCompanies,
      this.eventContacts,
      this.eventCouples});

  EventDetails.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    vid = json['vid'];
    eventType = json['event_type'];
    eventName = json['event_name'];
    guests = json['guests'];
    datesOfEvent = json['dates_of_event'];
    billingAddress = json['billing_address'];
    postCode = json['post_code'];
    if (json['team_members'] != null) {
      teamMembers = <TeamMembers>[];
      json['team_members'].forEach((v) {
        teamMembers!.add(new TeamMembers.fromJson(v));
      });
    }
    eventGroupId = json['event_group_id'] != null
        ? new EventGroupId.fromJson(json['event_group_id'])
        : null;
    if (json['event_space_ids'] != null) {
      eventSpaceIds = <EventSpaceIds>[];
      json['event_space_ids'].forEach((v) {
        eventSpaceIds!.add(new EventSpaceIds.fromJson(v));
      });
    }
    coupleEmail = json['couple_email'];
    createdAt = json['created_at'];
    id = json['id'];
    brideName = json['BrideName'];
    groomName = json['GroomName'];
    functionDate = json['FunctionDate'];
    profileImg = json['profile_img'];
    email = json['Email'];
    password = json['Password'];
    phone = json['phone'];
    address = json['address'];
    forgotPassKey = json['forgot_pass_key'];
    budget = json['budget'];
    finalCost = json['final_cost'];
    createdt = json['Created_at'];
    if (json['eventCompanies'] != null) {
      eventCompanies = <EventCompanies>[];
      json['eventCompanies'].forEach((v) {
        eventCompanies!.add(new EventCompanies.fromJson(v));
      });
    }
    if (json['eventContacts'] != null) {
      eventContacts = <EventContacts>[];
      json['eventContacts'].forEach((v) {
        eventContacts!.add(new EventContacts.fromJson(v));
      });
    }
    if (json['eventCouples'] != null) {
      eventCouples = <EventCouples>[];
      json['eventCouples'].forEach((v) {
        eventCouples!.add(new EventCouples.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['vid'] = this.vid;
    data['event_type'] = this.eventType;
    data['event_name'] = this.eventName;
    data['guests'] = this.guests;
    data['dates_of_event'] = this.datesOfEvent;
    data['billing_address'] = this.billingAddress;
    data['post_code'] = this.postCode;
    if (this.teamMembers != null) {
      data['team_members'] = this.teamMembers!.map((v) => v.toJson()).toList();
    }
    if (this.eventGroupId != null) {
      data['event_group_id'] = this.eventGroupId!.toJson();
    }
    if (this.eventSpaceIds != null) {
      data['event_space_ids'] =
          this.eventSpaceIds!.map((v) => v.toJson()).toList();
    }
    data['couple_email'] = this.coupleEmail;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['BrideName'] = this.brideName;
    data['GroomName'] = this.groomName;
    data['FunctionDate'] = this.functionDate;
    data['profile_img'] = this.profileImg;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['forgot_pass_key'] = this.forgotPassKey;
    data['budget'] = this.budget;
    data['final_cost'] = this.finalCost;
    data['Created_at'] = this.createdt;
    if (this.eventCompanies != null) {
      data['eventCompanies'] =
          this.eventCompanies!.map((v) => v.toJson()).toList();
    }
    if (this.eventContacts != null) {
      data['eventContacts'] =
          this.eventContacts!.map((v) => v.toJson()).toList();
    }
    if (this.eventCouples != null) {
      data['eventCouples'] = this.eventCouples!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeamMembers {
  String? id;
  String? fullName;
  String? profilePicture;
  String? holiday;

  TeamMembers({this.id, this.fullName, this.profilePicture, this.holiday});

  TeamMembers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    profilePicture = json['profile_picture'];
    holiday = json['holiday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['profile_picture'] = this.profilePicture;
    data['holiday'] = this.holiday;
    return data;
  }
}

class EventGroupId {
  String? id;
  String? groupName;
  List<RoomDetails>? roomDetails;

  EventGroupId({this.id, this.groupName, this.roomDetails});

  EventGroupId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['group_name'];
    if (json['room_details'] != null) {
      roomDetails = <RoomDetails>[];
      json['room_details'].forEach((v) {
        roomDetails!.add(new RoomDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_name'] = this.groupName;
    if (this.roomDetails != null) {
      data['room_details'] = this.roomDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RoomDetails {
  String? room;
  String? fromTime;
  String? toTime;

  RoomDetails({this.room, this.fromTime, this.toTime});

  RoomDetails.fromJson(Map<String, dynamic> json) {
    room = json['room'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room'] = this.room;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    return data;
  }
}

class EventSpaceIds {
  String? id;
  String? eventSpaceName;
  String? eventSpaceTime;
  List<Capacity>? capacity;
  List<String>? docFile;
  List<String>? docFileLabel;
  List<FixedFurniture>? fixedFurniture;

  EventSpaceIds(
      {this.id,
      this.eventSpaceName,
      this.eventSpaceTime,
      this.capacity,
      this.docFile,
      this.docFileLabel,
      this.fixedFurniture});

  EventSpaceIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventSpaceName = json['event_space_name'];
    eventSpaceTime = json['event_space_time'];
    if (json['capacity'] != null) {
      capacity = <Capacity>[];
      json['capacity'].forEach((v) {
        capacity!.add(new Capacity.fromJson(v));
      });
    }
    docFile = json['doc_file'].cast<String>();
    docFileLabel = json['doc_file_label'].cast<String>();
    if (json['fixed_furniture'] != null) {
      fixedFurniture = <FixedFurniture>[];
      json['fixed_furniture'].forEach((v) {
        fixedFurniture!.add(new FixedFurniture.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_space_name'] = this.eventSpaceName;
    data['event_space_time'] = this.eventSpaceTime;
    if (this.capacity != null) {
      data['capacity'] = this.capacity!.map((v) => v.toJson()).toList();
    }
    data['doc_file'] = this.docFile;
    data['doc_file_label'] = this.docFileLabel;
    if (this.fixedFurniture != null) {
      data['fixed_furniture'] =
          this.fixedFurniture!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Capacity {
  String? capacityName;
  String? capacity;

  Capacity({this.capacityName, this.capacity});

  Capacity.fromJson(Map<String, dynamic> json) {
    capacityName = json['capacityName'];
    capacity = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['capacityName'] = this.capacityName;
    data['capacity'] = this.capacity;
    return data;
  }
}

class FixedFurniture {
  String? itemName;
  String? itemDetails;

  FixedFurniture({this.itemName, this.itemDetails});

  FixedFurniture.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    itemDetails = json['itemDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemName'] = this.itemName;
    data['itemDetails'] = this.itemDetails;
    return data;
  }
}

class EventCompanies {
  String? eCompId;
  String? eventID;
  String? companyName;
  String? createdAt;

  EventCompanies(
      {this.eCompId, this.eventID, this.companyName, this.createdAt});

  EventCompanies.fromJson(Map<String, dynamic> json) {
    eCompId = json['e_comp_id'];
    eventID = json['event_ID'];
    companyName = json['company_name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['e_comp_id'] = this.eCompId;
    data['event_ID'] = this.eventID;
    data['company_name'] = this.companyName;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class EventContacts {
  String? eContactId;
  String? eventID;
  String? contactName;
  String? contactEmail;
  String? contactPhone;
  String? createdAt;

  EventContacts(
      {this.eContactId,
      this.eventID,
      this.contactName,
      this.contactEmail,
      this.contactPhone,
      this.createdAt});

  EventContacts.fromJson(Map<String, dynamic> json) {
    eContactId = json['e_contact_id'];
    eventID = json['event_ID'];
    contactName = json['contact_name'];
    contactEmail = json['contact_email'];
    contactPhone = json['contact_phone'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['e_contact_id'] = this.eContactId;
    data['event_ID'] = this.eventID;
    data['contact_name'] = this.contactName;
    data['contact_email'] = this.contactEmail;
    data['contact_phone'] = this.contactPhone;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class EventCouples {
  String? eCId;
  String? eventID;
  String? couplesName;
  String? gender;
  String? createdAt;

  EventCouples(
      {this.eCId, this.eventID, this.couplesName, this.gender, this.createdAt});

  EventCouples.fromJson(Map<String, dynamic> json) {
    eCId = json['e_c_id'];
    eventID = json['event_ID'];
    couplesName = json['couples_name'];
    gender = json['gender'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['e_c_id'] = this.eCId;
    data['event_ID'] = this.eventID;
    data['couples_name'] = this.couplesName;
    data['gender'] = this.gender;
    data['created_at'] = this.createdAt;
    return data;
  }
}
