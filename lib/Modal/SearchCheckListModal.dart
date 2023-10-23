class SearchCheckListModal {
  String? status;
  String? message;
  List<Searched>? searched;

  SearchCheckListModal({this.status, this.message, this.searched});

  SearchCheckListModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['searched'] != null) {
      searched = <Searched>[];
      json['searched'].forEach((v) {
        searched!.add(new Searched.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.searched != null) {
      data['searched'] = this.searched!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Searched {
  String? id;
  String? uid;
  String? taskTitle;
  String? taskDesc;
  String? category;
  String? startTime;
  String? endTime;
  String? isCompleted;
  String? createdAt;

  Searched(
      {this.id,
        this.uid,
        this.taskTitle,
        this.taskDesc,
        this.category,
        this.startTime,
        this.endTime,
        this.isCompleted,
        this.createdAt});

  Searched.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    taskTitle = json['task_title'];
    taskDesc = json['task_desc'];
    category = json['category'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isCompleted = json['is_completed'];
    createdAt = json['created_at'];
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
    data['is_completed'] = this.isCompleted;
    data['created_at'] = this.createdAt;
    return data;
  }
}
