import 'package:flutter/material.dart';
import 'package:prov/util/provider.dart';
import 'package:provider/provider.dart';

class ColorDropdown extends StatefulWidget {
  const ColorDropdown({super.key});

  @override
  State<ColorDropdown> createState() => _ColorDropdownState();
}

class _ColorDropdownState extends State<ColorDropdown> {
  List<DropdownMenuItem<String>> get dropDownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "0", child: Text("Red")),
      const DropdownMenuItem(value: "1", child: Text("Blue")),
      const DropdownMenuItem(value: "2", child: Text("Cyan")),
      const DropdownMenuItem(value: "3", child: Text("Green")),
      const DropdownMenuItem(value: "4", child: Text("Yellow")),
    ];
    return menuItems;
  }

  String selectedValue = "0";

  @override
  Widget build(BuildContext context) {
    final customer = Provider.of<Customer>(context, listen: true);
    return Container(
      color: Colors.blueGrey,
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
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
                  return Container(
                      child: Row(
                    children: [
                      Container(
                        color: customer.kolorrolki[index],
                        width: 20,
                        height: 30,
                      ),

                      // Text("Color$index"),
                    ],
                  ));
                }),
          ),
        ],
      ),
    );
  }
}
