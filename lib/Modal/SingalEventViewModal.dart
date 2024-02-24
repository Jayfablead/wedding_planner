class SingalEventViewModal {
  String? id;
  String? venueID;
  String? eventSpaceName;
  String? eventSpaceTime;
  List<Capacity>? capacity;
  List<String>? docFile;
  List<String>? docFileLabel;
  List<FixedFurniture>? fixedFurniture;
  String? createdAt;
  String? updatedAt;

  SingalEventViewModal(
      {this.id,
      this.venueID,
      this.eventSpaceName,
      this.eventSpaceTime,
      this.capacity,
      this.docFile,
      this.docFileLabel,
      this.fixedFurniture,
      this.createdAt,
      this.updatedAt});

  SingalEventViewModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueID = json['venueID'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['venueID'] = this.venueID;
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
