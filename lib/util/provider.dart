import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Customer extends ChangeNotifier {
  List listaRolek = [];

  TextEditingController namecontroller = TextEditingController();
  TextEditingController typecontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();

  int currentIndex = 0;

  void addRoll() {
    listaRolek
        .add([namecontroller.text, typecontroller.text, weightcontroller.text]);

    namecontroller.clear();
    typecontroller.clear();
    weightcontroller.clear();
    updateDataBase();
    notifyListeners();
  }

  void updateRoll(int index) {
    listaRolek.removeAt(index);
    listaRolek
        .add([namecontroller.text, typecontroller.text, weightcontroller.text]);

    namecontroller.clear();
    typecontroller.clear();
    weightcontroller.clear();
    updateDataBase();
    notifyListeners();
  }

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    listaRolek = [
      ["dummyName", "dummyType", "100"],
      ["dummyName2", "dummyType2", "200"],
    ];
    notifyListeners();
  }

  // load the data from database
  void loadData() {
    listaRolek = _myBox.get("TODOLIST");
    notifyListeners();
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", listaRolek);
    notifyListeners();
  }
}
