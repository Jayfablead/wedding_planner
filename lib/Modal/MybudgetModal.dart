class MybudgetModal {
  String? status;
  String? message;
  BudgetInfo? budgetInfo;
  List<BudgetItems>? budgetItems;

  MybudgetModal({this.status, this.message, this.budgetInfo, this.budgetItems});

  MybudgetModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    budgetInfo = json['budgetInfo'] != null
        ? new BudgetInfo.fromJson(json['budgetInfo'])
        : null;
    if (json['budgetItems'] != null) {
      budgetItems = <BudgetItems>[];
      json['budgetItems'].forEach((v) {
        budgetItems!.add(new BudgetItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.budgetInfo != null) {
      data['budgetInfo'] = this.budgetInfo!.toJson();
    }
    if (this.budgetItems != null) {
      data['budgetItems'] = this.budgetItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BudgetInfo {
  String? id;
  String? budget;
  String? finalCost;

  BudgetInfo({this.id, this.budget, this.finalCost});

  BudgetInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    budget = json['budget'];
    finalCost = json['final_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['budget'] = this.budget;
    data['final_cost'] = this.finalCost;
    return data;
  }
}

class BudgetItems {
  String? id;
  String? uid;
  String? categoryId;
  String? supplierId;
  String? estimateCost;
  String? bookingCost;
  Null? note;
  String? createdAt;
  SupplierInfo? supplierInfo;

  BudgetItems(
      {this.id,
      this.uid,
      this.categoryId,
      this.supplierId,
      this.estimateCost,
      this.bookingCost,
      this.note,
      this.createdAt,
      this.supplierInfo});

  BudgetItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    categoryId = json['category_id'];
    supplierId = json['supplier_id'];
    estimateCost = json['estimate_cost'];
    bookingCost = json['booking_cost'];
    note = json['note'];
    createdAt = json['created_at'];
    supplierInfo = json['supplierInfo'] != null
        ? new SupplierInfo.fromJson(json['supplierInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['category_id'] = this.categoryId;
    data['supplier_id'] = this.supplierId;
    data['estimate_cost'] = this.estimateCost;
    data['booking_cost'] = this.bookingCost;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    if (this.supplierInfo != null) {
      data['supplierInfo'] = this.supplierInfo!.toJson();
    }
    return data;
  }
}

class SupplierInfo {
  String? id;
  String? name;
  String? description;
  String? cost;
  String? categoryId;
  String? category;

  SupplierInfo(
      {this.id,
      this.name,
      this.description,
      this.cost,
      this.categoryId,
      this.category});

  SupplierInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    cost = json['cost'];
    categoryId = json['category_id'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['cost'] = this.cost;
    data['category_id'] = this.categoryId;
    data['category'] = this.category;
    return data;
  }
}
