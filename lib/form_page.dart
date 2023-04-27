import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class form_page extends StatefulWidget {
  const form_page({super.key});

  @override
  State<form_page> createState() => _form_pageState();
}

class _form_pageState extends State<form_page> {
  // List<String> damodata = [];

  TextEditingController name_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();

  Box? studentBox;
  @override
  void initState() {
    studentBox = Hive.box("Student_list");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create data"),
        centerTitle: true,
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Center(
                      child: CircleAvatar(
                          //backgroundImage: ,
                          radius: 60,
                          child: Image.asset("")),
                      //     child: Text(
                      //   "Add your Data",
                      //   style:
                      //       TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      // )
                    ),
                    height: 200),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: name_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: address_controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Address")),
              ),
              // save bottom............................
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.amber,
                  onPressed: () async {
                    try {
                      final userInput = name_controller.text;
                      await studentBox!.add(userInput);
                      name_controller.clear();
                      Fluttertoast.showToast(msg: "New name added");
                    } catch (e) {
                      Fluttertoast.showToast(msg: e.toString());
                    }
                  },
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
