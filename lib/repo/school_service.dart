import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:know_our_school/Model/model.dart';

class SchoolServices {
  static Future<List<SchoolDataModel>> readData() async {
    try {
      String response =
          await rootBundle.loadString('lib/JSONdata/SchoolData.json');
      final data = json.decode(response) as List<dynamic>;

      final list = data.map((e) => SchoolDataModel.fromJson(e)).toList();
      final carry = list[0] as SchoolDataModel;
      return list;
    } catch (e) {
      print(e);
    }
    return [SchoolDataModel()];
  }
}
