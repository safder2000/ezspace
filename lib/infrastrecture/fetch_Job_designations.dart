import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ezspace/model/job_model.dart';

class JobDesesignationRepo {
  static var dio = Dio();

  static fetchDesignations() async {
    List<String>? designationList = [];

    try {
      Response response = await dio.get(
        'https://devstaticapi.hire22.co/v1/jobdesignations',
      );
      final responseAsList =
          (response.data['jobdesignations'] as List).map((e) {
        return Jobdesignations.fromJson(e);
      }).toList();
      // log(responseAsList.toString());
      log('call sucessfull');
      // filter designations to list
      responseAsList.forEach(
          (element) => designationList.add(element.designation.toString()));

      return designationList;
    } catch (e) {
      print(e);
    }
  }
}
