// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:prov/util/provider.dart';
import 'package:provider/provider.dart';

class EmptySpool extends StatefulWidget {
  final namecontroller;
  final weightcontroller;

  VoidCallback onCancel;

  EmptySpool(
      {super.key,
      required this.namecontroller,
      required this.weightcontroller,
      required this.onCancel});

  @override
  State<EmptySpool> createState() => _EmptySpoolState();
}

class _EmptySpoolState extends State<EmptySpool> {
  @override
  Widget build(BuildContext context) {
    final customer = Provider.of<Customer>(context, listen: true);

    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Spool brand:'),
              TextField(
                maxLength: 16,
                controller: customer.enamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const Text('Net. weight:'),
              TextField(
                controller: customer.eweightcontroller,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              Text("Clear Picture"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                      text: 'ADD',
                      onPressed: () {
                        customer.addEmptyRoll();
                        Navigator.of(context).pop();
                        print("dodaj pusta");
                        print(customer.listaPustychRolek);
                      }),
                  const SizedBox(
                    width: 20,
                  ),
                  MyButton(text: 'CANCEL', onPressed: widget.onCancel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
