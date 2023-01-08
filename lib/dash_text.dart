import 'package:flutter/material.dart';
import 'package:prov/util/provider.dart';
import 'package:provider/provider.dart';

class DashText extends StatefulWidget {
  final String dashText;
  final String sortText;
  const DashText({super.key, required this.dashText, required this.sortText});

  @override
  State<DashText> createState() => _DashTextState();
}

class _DashTextState extends State<DashText> {
  @override
  Widget build(BuildContext context) {
    final customer = Provider.of<Customer>(context, listen: true);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.dashText,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blueGrey,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 17, 71, 133),
                    ),
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(124, 209, 209, 218),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    customer.sortByName();
                  });
                },
                child: Text(
                  widget.sortText,
                  style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
