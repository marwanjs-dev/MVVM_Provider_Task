//TODO: add your view model class here
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:know_our_school/Model/model.dart';
import 'package:know_our_school/repo/school_service.dart';

class SchoolViewModel extends ChangeNotifier {
  String _schoolName = "School Name";
  String _schoolAddress = "School Address";
  String _studentsNo = "Number of Students";
  String _teachersNo = "Number of Teachers";
  //attributes
  bool _loading = false;
  SchoolDataModel _schoolDataModel = SchoolDataModel();
  //getters
  bool get loading => _loading;
  SchoolDataModel get schoolDataModel => _schoolDataModel;

  Future<void> getSchoolData() async {
    List<SchoolDataModel> response = await SchoolServices.readData();
    _schoolName = response[0].schoolName!;
    _schoolAddress = response[0].schoolAddress!;
    _studentsNo = response[0].numberOfStudents!;
    _teachersNo = response[0].numberOfTeachers!;
    notifyListeners();
  }

  String get schoolName => _schoolName;
  String get schoolAddress => _schoolAddress;
  String get studentsNo => _studentsNo;
  String get teachersNo => _teachersNo;
}
