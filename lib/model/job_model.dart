class JobModel {
  List<Jobdesignations>? jobdesignations;

  JobModel({this.jobdesignations});

  JobModel.fromJson(Map<String, dynamic> json) {
    if (json['jobdesignations'] != null) {
      jobdesignations = <Jobdesignations>[];
      json['jobdesignations'].forEach((v) {
        jobdesignations!.add(Jobdesignations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.jobdesignations != null) {
      data['jobdesignations'] =
          this.jobdesignations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jobdesignations {
  int? designationId;
  String? designation;
  Null? roleId;

  Jobdesignations({this.designationId, this.designation, this.roleId});

  Jobdesignations.fromJson(Map<String, dynamic> json) {
    designationId = json['designation_id'];
    designation = json['designation'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['designation_id'] = this.designationId;
    data['designation'] = this.designation;
    data['role_id'] = this.roleId;
    return data;
  }
}
