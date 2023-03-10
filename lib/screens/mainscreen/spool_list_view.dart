import 'package:flutter/material.dart';
import 'package:prov/screens/mainscreen/color_dropdown.dart';

import 'package:prov/screens/mainscreen/editdialog.dart';
import 'package:prov/util/provider.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SpoolListView extends StatefulWidget {
  const SpoolListView({
    super.key,
  });

  @override
  State<SpoolListView> createState() => _SpoolListViewState();
}

class _SpoolListViewState extends State<SpoolListView> {
  @override
  Widget build(BuildContext context) {
    final customer = Provider.of<Customer>(context, listen: true);
    String text = "";
    int x = 0;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: customer.listaRolek.length,
          itemBuilder: (
            context,
            index,
          ) {
            customer.currentIndex = index;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 197, 197, 197),
                      width: 2.0),
                  color: Color.fromARGB(255, 224, 224, 224),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 4,
                      offset: Offset(4, 8),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Container(
                                  child: AutoSizeText(
                                    maxLines: 1,
                                    "${customer.listaRolek[index][0]}"
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.blueGrey),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8.0,
                                ),
                                child: Container(
                                  width: 60,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 211, 4, 1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Color.fromRGBO(118, 66, 200, 1),
                                        width: 3.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${customer.listaRolek[index][1]}"
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.indigo),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              customer.currentIndex = index;
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      Center(child: const ColorDropdown()));
                            },
                            child: Container(
                                width: 20,
                                height: 50,
                                color: (customer.listaRolek[index][3] == "0")
                                    ? Colors.red
                                    : (customer.listaRolek[index][3] == "1")
                                        ? Colors.blue
                                        : (customer.listaRolek[index][3] == "2")
                                            ? Colors.cyan
                                            : (customer.listaRolek[index][3] ==
                                                    "3")
                                                ? Colors.green
                                                : (customer.listaRolek[index]
                                                            [3] ==
                                                        "4")
                                                    ? Colors.yellow
                                                    : (customer.listaRolek[index]
                                                                [3] ==
                                                            "5")
                                                        ? Colors.black
                                                        : (customer.listaRolek[
                                                                    index][3] ==
                                                                "6")
                                                            ? Colors.white
                                                            : (customer.listaRolek[index]
                                                                        [3] ==
                                                                    "7")
                                                                ? Colors.orange
                                                                : (customer.listaRolek[index][3] ==
                                                                        "8")
                                                                    ? Colors
                                                                        .grey
                                                                    : (customer.listaRolek[index][3] ==
                                                                            "9")
                                                                        ? Colors
                                                                            .pink
                                                                        : (customer.listaRolek[index][3] ==
                                                                                "10")
                                                                            ? Colors.purple
                                                                            : (customer.listaRolek[index][3] == "11")
                                                                                ? Colors.teal
                                                                                : (customer.listaRolek[index][3] == "12")
                                                                                    ? Colors.brown
                                                                                    : Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Weight:",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.indigo),
                              ),
                              Text("${customer.listaRolek[index][2]}g.",
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => SimpleDialog(
                                      contentPadding: const EdgeInsets.all(12),
                                      backgroundColor: const Color.fromARGB(
                                          255, 245, 227, 219),
                                      title: const Text("Amount printed?"),
                                      children: [
                                        SizedBox(
                                          width: 20,
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  text = value;
                                                  x = int.parse(text);
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(
                                              () {
                                                var y = int.parse(customer
                                                    .listaRolek[index][2]);
                                                var result = y - x;
                                                customer.listaRolek[index][2] =
                                                    result.toString();
                                              },
                                            );
                                            customer.updateDataBase();
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("OK"),
                                        ),
                                      ],
                                    ),
                                  );
                                  setState(
                                    () {},
                                  );
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.amber[900],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                      scale: 18,
                                      fit: BoxFit.scaleDown,
                                      "images/printer.png"),
                                ),
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
                              customer.namecontroller.text =
                                  customer.listaRolek[index][0];
                              customer.typecontroller.text =
                                  customer.listaRolek[index][1];
                              customer.weightcontroller.text =
                                  customer.listaRolek[index][2];
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return EditBox(
                                        namecontroller: customer.namecontroller,
                                        typecontroller: customer.typecontroller,
                                        weightcontroller:
                                            customer.weightcontroller,
                                        onSave: () {},
                                        onCancel: () {
                                          Navigator.of(context).pop();
                                          customer.namecontroller.clear();
                                          customer.typecontroller.clear();
                                          customer.weightcontroller.clear();
                                        });
                                  });
                            }

                            if (i == "2") {
                              setState(
                                () {
                                  customer.listaRolek.removeAt(index);
                                },
                              );
                              customer.updateDataBase();
                            }
                          },
                          onCanceled: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
