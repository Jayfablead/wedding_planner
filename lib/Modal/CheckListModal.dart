class CheckListModal {
  String? status;
  String? message;
  List<Completed>? completed;
  List<TodayAlerts>? todayAlerts;
  List<Pendding>? pending;

  CheckListModal(
      {this.status,
        this.message,
        this.completed,
        this.todayAlerts,
        this.pending});

  CheckListModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['completed'] != null) {
      completed = <Completed>[];
      json['completed'].forEach((v) {
        completed!.add(new Completed.fromJson(v));
      });
    }
    if (json['todayAlerts'] != null) {
      todayAlerts = <TodayAlerts>[];
      json['todayAlerts'].forEach((v) {
        todayAlerts!.add(new TodayAlerts.fromJson(v));
      });
    }
    if (json['pending'] != null) {
      pending = <Pendding>[];
      json['pending'].forEach((v) {
        pending!.add(new Pendding.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.completed != null) {
      data['completed'] = this.completed!.map((v) => v.toJson()).toList();
    }
    if (this.todayAlerts != null) {
      data['todayAlerts'] = this.todayAlerts!.map((v) => v.toJson()).toList();
    }
    if (this.pending != null) {
      data['pending'] = this.pending!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Completed {
  String? id;
  String? uid;
  String? taskTitle;
  String? taskDesc;
  String? category;
  String? startTime;
  String? endTime;
  String? isCompleted;
  String? createdAt;

  Completed(
      {this.id,
        this.uid,
        this.taskTitle,
        this.taskDesc,
        this.category,
        this.startTime,
        this.endTime,
        this.isCompleted,
        this.createdAt});

  Completed.fromJson(Map<String, dynamic> json) {
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
class TodayAlerts {
  String? id;
  String? uid;
  String? taskTitle;
  String? taskDesc;
  String? category;
  String? startTime;
  String? endTime;
  String? isCompleted;
  String? createdAt;

  TodayAlerts(
      {this.id,
        this.uid,
        this.taskTitle,
        this.taskDesc,
        this.category,
        this.startTime,
        this.endTime,
        this.isCompleted,
        this.createdAt});

  TodayAlerts.fromJson(Map<String, dynamic> json) {
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
class Pendding {
  String? id;
  String? uid;
  String? taskTitle;
  String? taskDesc;
  String? category;
  String? startTime;
  String? endTime;
  String? isCompleted;
  String? createdAt;

  Pendding(
      {this.id,
        this.uid,
        this.taskTitle,
        this.taskDesc,
        this.category,
        this.startTime,
        this.endTime,
        this.isCompleted,
        this.createdAt});

  Pendding.fromJson(Map<String, dynamic> json) {
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
