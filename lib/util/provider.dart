import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Customer extends ChangeNotifier {
  var kolorrolki = [
    Colors.red,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.yellow,
    Colors.black,
    Colors.white,
  ];

  List listaRolek = [];

  TextEditingController namecontroller = TextEditingController();
  TextEditingController typecontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController colorcontroller = TextEditingController();

  int currentIndex = 0;

  void addRoll() {
    listaRolek.add([
      namecontroller.text,
      typecontroller.text,
      weightcontroller.text,
      colorcontroller.text
    ]);

    namecontroller.clear();
    typecontroller.clear();
    weightcontroller.clear();
    updateDataBase();
    notifyListeners();
  }

  void updateRoll(int index) {
    listaRolek.removeAt(index);
    listaRolek.add([
      namecontroller.text,
      typecontroller.text,
      weightcontroller.text,
      colorcontroller.text
    ]);

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
      ["dummyName", "dummyType", "100", "0"],
      ["dummyName2", "dummyType2", "200", "3"],
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
