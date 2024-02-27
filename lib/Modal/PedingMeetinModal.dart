class PedingMeetinModal {
  String? status;
  String? message;
  List<MeetingsByDate>? meetingsByDate;

  PedingMeetinModal({this.status, this.message, this.meetingsByDate});

  PedingMeetinModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['meetingsByDate'] != null) {
      meetingsByDate = <MeetingsByDate>[];
      json['meetingsByDate'].forEach((v) {
        meetingsByDate!.add(new MeetingsByDate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.meetingsByDate != null) {
      data['meetingsByDate'] =
          this.meetingsByDate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MeetingsByDate {
  String? id;
  String? uid;
  String? taskTitle;
  String? taskDesc;
  String? category;
  String? startTime;
  String? endTime;

  MeetingsByDate(
      {this.id,
        this.uid,
        this.taskTitle,
        this.taskDesc,
        this.category,
        this.startTime,
        this.endTime});

  MeetingsByDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    taskTitle = json['task_title'];
    taskDesc = json['task_desc'];
    category = json['category'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['task_title'] = this.taskTitle;
    data['task_desc'] = this.taskDesc;
    data['category'] = this.category;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
