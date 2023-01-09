import 'package:flutter/material.dart';
import 'package:prov/dash_text.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
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
                  itemCount: 3,
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
                                    child: Container(
                                      height: 70,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.orange, width: 2)),
                                      child: Image.network(
                                          fit: BoxFit.fill,
                                          "https://altwaylab.com/pol_pl_eSun-TPU-95A-Filament-Transparentny-Czerwony-1-75mm-1058_3.jpg"),
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
                                        "eSun TPU",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "238g",
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: Icon(Icons.more_vert),
                                      onPressed: () {},
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
