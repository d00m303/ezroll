import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prov/util/dash_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prov/screens/dbscreen/spoolsdialog.dart';
import 'package:prov/util/provider.dart';
import 'package:provider/provider.dart';
import 'editspoolsdialog.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _myBox = Hive.box('mybox');

  String path = "";
  int currentIndex = 0;

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final customer = Provider.of<Customer>(context, listen: false);

      if (_myBox.get("EMPTYSPOOLS") == null) {
        print("pusta");
      } else {
        customer.loadEmptyData();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final customer = Provider.of<Customer>(context, listen: true);

    void dialogEmptySpool() {
      showDialog(
        context: context,
        builder: (context) {
          return EmptySpool(
            namecontroller: customer.enamecontroller,
            weightcontroller: customer.eweightcontroller,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
      );
    }

    void pickImage() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? imageFile =
          await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        print(imageFile!.path);
        path = imageFile.path;
        customer.listaPustychRolek[currentIndex][0] = path;
        customer.updateeDataBase();
      });
    }

    return Scaffold(
        appBar: AppBar(
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Info')),
            ],
          ),
        ),
        body: Column(
          children: [
            DashText(dashText: "Empty Spools db:", sortText: "Sort"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: customer.listaPustychRolek.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(96, 125, 139, 1),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(224, 224, 224, 1),
                                  blurRadius: 4,
                                  offset: Offset(4, 8),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => Container(
                                            color: Colors.white,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                            child: Column(
                                              children: [
                                                (customer.listaPustychRolek[
                                                            index][0] !=
                                                        "empty")
                                                    ? Image.file(
                                                        File(customer
                                                                .listaPustychRolek[
                                                            index][0]),
                                                      )
                                                    : Text("Add Image"),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                ElevatedButton(
                                                  child: Text("Close"),
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      onLongPress: () {
                                        pickImage();
                                        currentIndex = index;
                                        print(currentIndex);
                                      },
                                      child: Container(
                                        height: 70,
                                        width: 53,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.orange, width: 2),
                                        ),
                                        child: Center(
                                          child:
                                              (customer.listaPustychRolek[index]
                                                          [0] !=
                                                      "empty")
                                                  ? Image.file(
                                                      File(customer
                                                              .listaPustychRolek[
                                                          index][0]),
                                                      fit: BoxFit.fill,
                                                    )
                                                  : Text(
                                                      "ADD\nIMG",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        customer.listaPustychRolek[index][1],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        customer.listaPustychRolek[index][2],
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  itemBuilder: (context) {
                                    return const [
                                      PopupMenuItem<String>(
                                          value: "1", child: Text("Edit")),
                                      PopupMenuItem<String>(
                                          value: "2", child: Text("Delete")),
                                    ];
                                  },
                                  icon: const Icon(Icons.more_vert),
                                  onSelected: (i) {
                                    if (i == "1") {
                                      customer.enamecontroller.text =
                                          customer.listaPustychRolek[index][1];

                                      customer.eweightcontroller.text =
                                          customer.listaPustychRolek[index][2];
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            customer.currentEmptyIndex = index;
                                            return EditEmptySpool(
                                                namecontroller:
                                                    customer.enamecontroller,
                                                weightcontroller:
                                                    customer.eweightcontroller,
                                                onCancel: () {
                                                  Navigator.of(context).pop();
                                                  customer.enamecontroller
                                                      .clear();

                                                  customer.eweightcontroller
                                                      .clear();
                                                });
                                          });
                                    }

                                    if (i == "2") {
                                      setState(
                                        () {
                                          customer.listaPustychRolek
                                              .removeAt(index);
                                        },
                                      );
                                      customer.updateeDataBase();
                                    }
                                  },
                                  onCanceled: () {},
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.blueGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add_circle,
                            color: Color.fromRGBO(255, 111, 0, 1)),
                        iconSize: 30,
                        onPressed: () {
                          dialogEmptySpool();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
