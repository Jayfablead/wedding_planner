class PedingDeliveryCollecationModal {
  String? status;
  String? message;
  List<Data>? data;

  PedingDeliveryCollecationModal({this.status, this.message, this.data});

  PedingDeliveryCollecationModal.fromJson(Map<String, dynamic> json) {
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
  String? scheduledDate;
  String? time;
  String? eventId;
  String? company;
  String? contactDetails;
  String? items;
  String? type;
  String? isCompleted;
  String? comments;
  String? createdAt;
  String? updatedAt;
  String? eventName;

  Data(
      {this.id,
        this.scheduledDate,
        this.time,
        this.eventId,
        this.company,
        this.contactDetails,
        this.items,
        this.type,
        this.isCompleted,
        this.comments,
        this.createdAt,
        this.updatedAt,
        this.eventName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheduledDate = json['scheduled_date'];
    time = json['time'];
    eventId = json['event_id'];
    company = json['Company'];
    contactDetails = json['contact_details'];
    items = json['Items'];
    type = json['type'];
    isCompleted = json['is_completed'];
    comments = json['Comments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    eventName = json['event_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scheduled_date'] = this.scheduledDate;
    data['time'] = this.time;
    data['event_id'] = this.eventId;
    data['Company'] = this.company;
    data['contact_details'] = this.contactDetails;
    data['Items'] = this.items;
    data['type'] = this.type;
    data['is_completed'] = this.isCompleted;
    data['Comments'] = this.comments;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['event_name'] = this.eventName;
    return data;
  }
}
