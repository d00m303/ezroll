import 'package:flutter/material.dart';
import 'package:prov/util/provider.dart';
import 'package:provider/provider.dart';

class ColorDropdown extends StatefulWidget {
  const ColorDropdown({super.key});

  @override
  State<ColorDropdown> createState() => _ColorDropdownState();
}

class _ColorDropdownState extends State<ColorDropdown> {
  @override
  Widget build(BuildContext context) {
    final customer = Provider.of<Customer>(context, listen: true);
    // ignore: unused_local_variable
    int currindex = 0;
    return Container(
      color: Colors.blueGrey,
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 50,
                    // childAspectRatio: 4 / 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: customer.kolorrolki.length,
                itemBuilder: (context, index) {
                  customer.colorIndex = index;
                  currindex = customer.currentIndex;

                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              customer.listaRolek[customer.currentIndex][3] =
                                  index.toString();
                            });
                            customer.updateDataBase();
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            color: customer.kolorrolki[index],
                            width: 30,
                            height: 40,
                          ),
                        ),
                      ),

                      // Text("Color$index"),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
