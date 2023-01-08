// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class DialogBox extends StatefulWidget {
  final namecontroller;
  final typecontroller;
  final weightcontroller;
  final colorcontroller;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      this.namecontroller,
      this.typecontroller,
      required this.weightcontroller,
      required this.colorcontroller,
      required this.onSave,
      required this.onCancel});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  Customer db = Customer();

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
              const Text('Brand:'),
              TextField(
                  maxLength: 16,
                  controller: customer.namecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  )),
              const Text('Type:'),
              TextField(
                  controller: customer.typecontroller,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder())),
              const Text('Weight:'),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: customer.weightcontroller,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder())),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                      text: 'ADD',
                      onPressed: () {
                        customer.addRoll();

                        Navigator.of(context).pop();
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
