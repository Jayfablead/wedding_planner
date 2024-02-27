class ViewMeetinModal {
  int? status;
  String? message;
  Data? data;

  ViewMeetinModal({this.status, this.message, this.data});

  ViewMeetinModal.fromJson(Map<String, dynamic> json) {
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
  String? placeType;
  String? placeName;
  String? taskDesc;
  String? category;
  Null? timeType;
  String? startTime;
  String? endTime;
  String? isCompleted;

  Data(
      {this.placeType,
        this.placeName,
        this.taskDesc,
        this.category,
        this.timeType,
        this.startTime,
        this.endTime,
        this.isCompleted});

  Data.fromJson(Map<String, dynamic> json) {
    placeType = json['place_type'];
    placeName = json['place_name'];
    taskDesc = json['task_desc'];
    category = json['category'];
    timeType = json['time_type'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isCompleted = json['is_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_type'] = this.placeType;
    data['place_name'] = this.placeName;
    data['task_desc'] = this.taskDesc;
    data['category'] = this.category;
    data['time_type'] = this.timeType;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['is_completed'] = this.isCompleted;
    return data;
  }
}
