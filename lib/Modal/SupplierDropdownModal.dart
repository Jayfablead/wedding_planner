class SupplierDropdownModal {
  String? status;
  String? message;
  List<SuppliersDetails>? suppliersDetails;

  SupplierDropdownModal({this.status, this.message, this.suppliersDetails});

  SupplierDropdownModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['suppliersDetails'] != null) {
      suppliersDetails = <SuppliersDetails>[];
      json['suppliersDetails'].forEach((v) {
        suppliersDetails!.add(new SuppliersDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.suppliersDetails != null) {
      data['suppliersDetails'] =
          this.suppliersDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SuppliersDetails {
  String? id;
  String? name;

  SuppliersDetails({this.id, this.name});

  SuppliersDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
