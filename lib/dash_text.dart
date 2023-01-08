import 'package:flutter/material.dart';

class DashText extends StatelessWidget {
  const DashText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Available Spools:",
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
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Text(
                "SORT",
                style: TextStyle(fontSize: 12, color: Colors.blueGrey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
