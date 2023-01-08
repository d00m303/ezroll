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
  TextEditingController colorcontroller = TextEditingController(text: "5");

  int currentIndex = 0;
  int colorIndex = 0;

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
      "5",
    ]);

    namecontroller.clear();
    typecontroller.clear();
    weightcontroller.clear();
    updateDataBase();
    notifyListeners();
  }

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    listaRolek = [
      ["dummyName", "dummyType", "100", "0"],
      ["dummyName2", "dummyType2", "200", "3"],
    ];
    notifyListeners();
  }

  void loadData() {
    listaRolek = _myBox.get("TODOLIST");
    notifyListeners();
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", listaRolek);
    notifyListeners();
  }

  void sortByName() {
    listaRolek.sort((a, b) => a[0].compareTo(b[0]));
    print(listaRolek);
    notifyListeners();
  }
}
