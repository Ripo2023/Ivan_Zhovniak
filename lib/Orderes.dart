import 'package:app/MainInterface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'DataModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Order.dart';
import 'firebase_options.dart';
import 'dart:convert';

class Orderes extends StatefulWidget {
  Orderes({super.key, required this.number});
  String? number;
  @override
  State<Orderes> createState() => _OrderesState();
}

class _OrderesState extends State<Orderes> {
  int currentIndex = 1;
  Future displayContent(number) async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final database = FirebaseDatabase.instance.ref();
    var snapshot = await database.child(widget.number.toString()).get();

    String s = await snapshot.value.toString();
    String result = s.replaceAll('{', '');
    result = result.replaceAll(':', '');
    result = result.replaceAll('}', '');
    result = result.replaceAll(',', '');

    final splitted = result.split(" ");
    var names = [];
    var icons = [];
    var prices = [];
    var keys = [];
    var volumes = [];
    var status = [];
    for (int i = 0; i < splitted.length; i++) {
      print(splitted[i]);
      if (i % 11 == 0) {
        keys.add(splitted[i]);
        continue;
      }
      if (splitted[i] == "price") {
        prices.add(splitted[i + 1]);
        continue;
      }
      if (splitted[i] == "status") {
        status.add(splitted[i + 1]);
        continue;
      }
      if (splitted[i] == "icon") {
        icons.add(splitted[i + 1]);
        continue;
      }
      if (splitted[i] == "name") {
        names.add(splitted[i + 1]);
        continue;
      }
      if (splitted[i] == "volume") {
        volumes.add(splitted[i + 1]);
        continue;
      }
    }
    print(names);
    return [names, icons, prices, keys, volumes, status];
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 70)),
          Text("Ready",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          FutureBuilder(
            future: displayContent(widget.number.toString()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var names = snapshot.data[0];
                var icons = snapshot.data[1];
                var prices = snapshot.data[2];
                var keys = snapshot.data[3];
                var volumes = snapshot.data[4];
                var status = snapshot.data[5];
                return Column(
                  children: [
                    for (int i = 0; i < names.length; i++)
                      if (status[i] == "0")
                        InkWell(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(8)),
                            width: MediaQuery.of(context).size.width - 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(90)),
                                  child: Image.asset(
                                    icons[i].toString(),
                                    height: 30,
                                  ),
                                ),
                                Container(
                                  width: 120,
                                ),
                                Text(
                                  keys[i],
                                  textAlign: TextAlign.end,
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            showGeneralDialog(
                              context: context,
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return AlertDialog(
                                  insetPadding: EdgeInsets.only(top: 60),
                                  content: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                "assets/Vector.png",
                                                width: 20,
                                              )),
                                          Text(
                                            "Product list",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                        "assets/divider.svg",
                                        width:
                                            MediaQuery.of(context).size.width +
                                                20,
                                      ),
                                      Container(
                                        height: 550,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      icons[i].toString()),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              names[i]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      300)),
                                                          Text(
                                                              prices[i]
                                                                  .toString(),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))
                                                        ],
                                                      ),
                                                      Text(
                                                        volumes[i].toString(),
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        "+ Milk",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                      Container(
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              20,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.orange),
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      content: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            20,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                                child:
                                                                    QrImageView(
                                                              data: widget
                                                                  .number
                                                                  .toString(),
                                                              version:
                                                                  QrVersions
                                                                      .auto,
                                                              size: 320,
                                                              gapless: false,
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text("QR code")),
                                        ),
                                      ),
                                    ]),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text("In progress",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          FutureBuilder(
            future: displayContent(widget.number.toString()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var names = snapshot.data[0];
                var icons = snapshot.data[1];
                var prices = snapshot.data[2];
                var keys = snapshot.data[3];
                var volumes = snapshot.data[4];
                var status = snapshot.data[5];
                return Column(
                  children: [
                    for (int i = 0; i < names.length; i++)
                      if (status[i] == "1")
                        InkWell(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(8)),
                            width: MediaQuery.of(context).size.width - 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(90)),
                                  child: Image.asset(
                                    icons[i].toString(),
                                    height: 30,
                                  ),
                                ),
                                Container(
                                  width: 120,
                                ),
                                Text(
                                  keys[i],
                                  textAlign: TextAlign.end,
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            showGeneralDialog(
                              context: context,
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return AlertDialog(
                                  insetPadding: EdgeInsets.only(top: 60),
                                  content: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                "assets/Vector.png",
                                                width: 20,
                                              )),
                                          Text(
                                            "Product list",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                        "assets/divider.svg",
                                        width:
                                            MediaQuery.of(context).size.width +
                                                20,
                                      ),
                                      Container(
                                        height: 550,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      icons[i].toString()),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              names[i]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      300)),
                                                          Text(
                                                              prices[i]
                                                                  .toString(),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))
                                                        ],
                                                      ),
                                                      Text(
                                                        volumes[i].toString(),
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        "+ Milk",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                      Container(
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              20,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.orange),
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      content: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            20,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                                child:
                                                                    QrImageView(
                                                              data: widget
                                                                  .number
                                                                  .toString(),
                                                              version:
                                                                  QrVersions
                                                                      .auto,
                                                              size: 320,
                                                              gapless: false,
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text("QR code")),
                                        ),
                                      ),
                                    ]),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Order',
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
            if (value == 0) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MainInterface()));
            }
          }),
    );
  }
}
