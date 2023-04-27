import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todoapp/data_update.dart';
import 'package:hive_todoapp/form_page.dart';

class hiv_home_page extends StatefulWidget {
  const hiv_home_page({super.key});

  @override
  State<hiv_home_page> createState() => _hive_home_State();
}

class _hive_home_State extends State<hiv_home_page> {
  //List<String> damodata = [];
  // TextEditingController name_controller = TextEditingController();

  // Future<void> addData() async {
  //   setState(() {
  //     // damodata.add(address_controller.text);
  //     damodata.add(name_controller.text);
  //   });
  // }

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
        title: const Text("Hive_Todo"),
        centerTitle: true,
      ),
      body: Container(

          //color: Color.fromARGB(255, 252, 252, 252),
          child: ValueListenableBuilder(
              valueListenable: Hive.box("Student_list").listenable(),
              builder: (context, box, Widget) {
                return ListView.builder(
                    itemCount: studentBox!.keys.toList().length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, right: 5, left: 5, bottom: 0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Card(
                            elevation: 5,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              // tileColor: Colors .primaries[Random().nextInt(Colors.primaries.length)],
                              //tileColor: Colors .primaries[index % Colors.primaries.length],

                              title: Text(
                                studentBox!.getAt(index).toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    data_update()),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color:
                                              Color.fromARGB(255, 10, 151, 83),
                                        )),
                                    /* IconButton(
                                        onPressed: () async {
                                          try {
                                            studentBox!.deleteAt(index);
                                            Fluttertoast.showToast(
                                                msg: "deleted sucessfull");
                                          } catch (e) {}
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))*/

                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    "Delete Alert",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red
                                                        // backgroundColor:
                                                        //     Colors.red
                                                        ),
                                                  ),
                                                  content: Text(
                                                    "Do you want delete ?",
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      // backgroundColor:
                                                      //     Colors.red
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        hiv_home_page()),
                                                          );
                                                        },
                                                        child: Text(
                                                          "No",
                                                          style: TextStyle(
                                                              fontSize: 22,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      8,
                                                                      155,
                                                                      84)
                                                              // backgroundColor:
                                                              //     Colors.red
                                                              ),
                                                        )),
                                                    TextButton(
                                                        onPressed: () async {
                                                          try {
                                                            studentBox!
                                                                .deleteAt(
                                                                    index);
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    "deleted sucessfull");
                                                          } catch (e) {}
                                                        },
                                                        child: Text(
                                                          "Yes",
                                                          style: TextStyle(
                                                              fontSize: 22,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      224,
                                                                      29,
                                                                      29)
                                                              // backgroundColor:
                                                              //     Colors.red
                                                              ),
                                                        )),
                                                  ],
                                                );
                                              });
                                        },
                                        icon: Icon(Icons.delete,
                                            color: Colors.red))
                                  ],
                                ),
                              ),

                              /*  trailing: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          // title: Text("alart diglog"),
                                          content: Text("subdigd"),
                                          actions: [
                                            Icon(
                                              Icons.edit,
                                              color: Colors.green[200],
                                            ),
                                            SizedBox(
                                              width: double.minPositive,
                                            ),
                                            IconButton(
                                                onPressed: () async {
                                                  try {
                                                    studentBox!.deleteAt(index);
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "deleted sucessfull");
                                                  } catch (e) {}
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ))
                                          ],
                                        );
                                      });
                                },
                                child: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                              ),*/
                            ),
                          ),
                        ),
                      );
                    }));
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => form_page())));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
