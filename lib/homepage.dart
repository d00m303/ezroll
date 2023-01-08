import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prov/dash_text.dart';
import 'package:prov/spool_list_view.dart';
import 'package:prov/util/dialog.dart';
import 'package:provider/provider.dart';
import 'util/provider.dart';

// TODO:

// dodac kolory
// dodac current color index bo przy edicie nie lapie, i daje default na czarny na razie
// sortowanie
// waga nowej rolki brutto

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final customer = Provider.of<Customer>(context, listen: false);

      if (_myBox.get("TODOLIST") == null) {
        customer.createInitialData();
      } else {
        customer.loadData();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final customer = Provider.of<Customer>(context, listen: true);

    void createNewSpool() {
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            namecontroller: customer.namecontroller,
            typecontroller: customer.typecontroller,
            weightcontroller: customer.weightcontroller,
            colorcontroller: customer.colorcontroller,
            onSave: customer.addRoll,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'images/logo.png',
          fit: BoxFit.cover,
          height: 40,
          width: 200,
        ),
      ),
      body: Column(
        children: [
          const DashText(dashText: "Available Spools:", sortText: "Sort"),
          const SpoolListView(),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.blueGrey,
                child: IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: createNewSpool,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  iconSize: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
