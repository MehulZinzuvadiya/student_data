import 'package:flutter/material.dart';
import 'package:student_data/screen/model/stuModel.dart';

class HomeProvider extends ChangeNotifier {
  List<stuModel> l1 = [];

  void addData(stuModel s1) {
    l1.add(s1);
    notifyListeners();
  }
  void delete(int index)
  {
    l1.removeAt(index);
    notifyListeners();
  }
  void updateData(int index,stuModel s1)
  {
    l1[index] = s1;
    notifyListeners();
  }
}
