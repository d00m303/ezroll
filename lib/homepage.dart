import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prov/dash_text.dart';
import 'package:prov/spool_list_view.dart';
import 'package:prov/util/dialog.dart';
import 'package:provider/provider.dart';
import 'util/provider.dart';

// TODO:

// - color picker

// sortowanie

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  Color _color = Colors.blue;

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
          const DashText(),
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

          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   child: IconButton(
          //     onPressed: createNewSpool,
          //     icon: const Icon(Icons.add),
          //   ),
          // ),
        ],
      ),
    );
  }
}
