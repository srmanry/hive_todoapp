import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class data_update extends StatefulWidget {
  const data_update({super.key});

  @override
  State<data_update> createState() => _data_updateState();
}

class _data_updateState extends State<data_update> {
  TextEditingController name_update_controller = TextEditingController();
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
        title: Text("Hive_Todo"),
        centerTitle: true,
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                    child: Text(
                  "Update Data",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name_update_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Name"),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //       controller: address_controller,
            //       decoration: InputDecoration(
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(15),
            //           ),
            //           labelText: "Address")),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Colors.amber,
                onPressed: () {
                  final update_data = name_update_controller.text;
                  // studentBox!.putAt(index,update_data);
                  //studentBox!.put(index, update_data);
                  name_update_controller.clear();
                  Fluttertoast.showToast(msg: "added update data");
                  try {} catch (e) {
                    Fluttertoast.showToast(msg: e.toString());
                  }
                },
                child: Text("Save"),
              ),
            ),
            // ListView.builder(
            //     itemCount: studentBox!.keys.toList().length,
            //     itemBuilder: (_, index) {
            //       return ListTile(
            //         title: Text(studentBox!.getAt(index).toString()),
            //       );
            //     })
          ],
        ),
      )),
    );
  }
}
