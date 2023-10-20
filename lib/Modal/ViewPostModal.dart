class ViewPostModal {
  String? status;
  String? message;
  List<Boards>? boards;

  ViewPostModal({this.status, this.message, this.boards});

  ViewPostModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['boards'] != null) {
      boards = <Boards>[];
      json['boards'].forEach((v) {
        boards!.add(new Boards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.boards != null) {
      data['boards'] = this.boards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Boards {
  String? id;
  String? uid;
  String? categoryId;
  String? image;
  String? createdAt;

  Boards({this.id, this.uid, this.categoryId, this.image, this.createdAt});

  Boards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    categoryId = json['category_id'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}
