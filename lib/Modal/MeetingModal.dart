class MeetingModal {
  String? status;
  String? message;
  List<MeetingsByDate>? meetingsByDate;

  MeetingModal({this.status, this.message, this.meetingsByDate});

  MeetingModal.fromJson(Map<String, dynamic> json) {
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
  String? isCompleted;

  MeetingsByDate(
      {this.id,
        this.uid,
        this.taskTitle,
        this.taskDesc,
        this.category,
        this.isCompleted});

  MeetingsByDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    taskTitle = json['task_title'];
    taskDesc = json['task_desc'];
    category = json['category'];
    isCompleted = json['is_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['task_title'] = this.taskTitle;
    data['task_desc'] = this.taskDesc;
    data['category'] = this.category;
    data['is_completed'] = this.isCompleted;
    return data;
  }
}
