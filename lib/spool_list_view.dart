import 'package:flutter/material.dart';

import 'package:prov/util/editdialog.dart';
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
    Color _color = Colors.blue;
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
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                maxLines: 1,
                                "${customer.listaRolek[index][0]}",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.blueGrey),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "${customer.listaRolek[index][1]}",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.indigo),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                            width: 20,
                            height: 50,
                            color: (customer.listaRolek[index][3] == "0")
                                ? Colors.red
                                : (customer.listaRolek[index][3] == "1")
                                    ? Colors.blue
                                    : (customer.listaRolek[index][3] == "2")
                                        ? Colors.cyan
                                        : (customer.listaRolek[index][3] == "3")
                                            ? Colors.green
                                            : (customer.listaRolek[index][3] ==
                                                    "4")
                                                ? Colors.yellow
                                                : Colors.black),
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
                                child: Image.asset(
                                    scale: 18,
                                    fit: BoxFit.scaleDown,
                                    "images/printer.png"),
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
                                        onCancel: () =>
                                            Navigator.of(context).pop());
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
