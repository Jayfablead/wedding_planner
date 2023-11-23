class ItienraryModal {
  String? status;
  String? message;
  Data? data;

  ItienraryModal({this.status, this.message, this.data});

  ItienraryModal.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? uid;
  String? itineraryFileName;
  String? itinerary;
  String? createdAt;
  String? updatedAt;
  String? filePath;
  String? profileImg;

  Data(
      {this.id,
      this.uid,
      this.itineraryFileName,
      this.itinerary,
      this.createdAt,
      this.updatedAt,
      this.filePath,
      this.profileImg});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    itineraryFileName = json['itinerary_file_name'];
    itinerary = json['itinerary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    filePath = json['file_path'];
    profileImg = json['profile_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['itinerary_file_name'] = this.itineraryFileName;
    data['itinerary'] = this.itinerary;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['file_path'] = this.filePath;
    data['profile_img'] = this.profileImg;
    return data;
  }
}
