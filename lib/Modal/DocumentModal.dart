class DocumentModal {
  String? status;
  String? message;
  Data? data;

  DocumentModal({this.status, this.message, this.data});

  DocumentModal.fromJson(Map<String, dynamic> json) {
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
  List<AllDocandCerti>? allDocandCerti;
  List<Contracts>? contracts;

  Data({this.allDocandCerti, this.contracts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['allDocandCerti'] != null) {
      allDocandCerti = <AllDocandCerti>[];
      json['allDocandCerti'].forEach((v) {
        allDocandCerti!.add(new AllDocandCerti.fromJson(v));
      });
    }
    if (json['contracts'] != null) {
      contracts = <Contracts>[];
      json['contracts'].forEach((v) {
        contracts!.add(new Contracts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allDocandCerti != null) {
      data['allDocandCerti'] =
          this.allDocandCerti!.map((v) => v.toJson()).toList();
    }
    if (this.contracts != null) {
      data['contracts'] = this.contracts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllDocandCerti {
  String? docName;
  String? docType;
  String? docFile;
  String? name;
  String? profile;
  String? createdAt;

  AllDocandCerti(
      {this.docName,
      this.docType,
      this.docFile,
      this.name,
      this.profile,
      this.createdAt});

  AllDocandCerti.fromJson(Map<String, dynamic> json) {
    docName = json['doc_name'];
    docType = json['doc_type'];
    docFile = json['doc_file'];
    name = json['name'];
    profile = json['profile'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_name'] = this.docName;
    data['doc_type'] = this.docType;
    data['doc_file'] = this.docFile;
    data['name'] = this.name;
    data['profile'] = this.profile;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Contracts {
  String? name;
  Null? profile;
  String? contractDate;
  String? contractDesc;
  String? contractAmount;

  Contracts(
      {this.name,
      this.profile,
      this.contractDate,
      this.contractDesc,
      this.contractAmount});

  Contracts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profile = json['profile'];
    contractDate = json['contract_date'];
    contractDesc = json['contract_desc'];
    contractAmount = json['contract_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profile'] = this.profile;
    data['contract_date'] = this.contractDate;
    data['contract_desc'] = this.contractDesc;
    data['contract_amount'] = this.contractAmount;
    return data;
  }
}
