import 'dart:convert';

import 'package:app/Order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'DataModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Map.dart';
import 'Orderes.dart';
import 'firebase_options.dart';
import 'package:uuid/uuid.dart';

class MainInterface extends StatefulWidget {
  @override
  State<MainInterface> createState() => _MainInterfaceState();
}

class _MainInterfaceState extends State<MainInterface> {
  TextStyle textStyle1 = TextStyle(color: Colors.white);
  TextStyle textStyle2 = TextStyle(color: Colors.grey);
  TextStyle textStyle3 = TextStyle(color: Colors.grey);
  TextStyle textStyle4 = TextStyle(color: Colors.grey);
  Image img = Image.asset("assets/Caramel.png");
  TextStyle textStyle1a = TextStyle(color: Colors.white);
  TextStyle textStyle2a = TextStyle(color: Colors.grey);
  TextStyle textStyle3a = TextStyle(color: Colors.grey);
  TextStyle textStyle4a = TextStyle(color: Colors.grey);
  int currentIndex = 0;
  ButtonStyle buttonStyle1a =
      ElevatedButton.styleFrom(backgroundColor: Colors.black);
  ButtonStyle buttonStyle2a =
      ElevatedButton.styleFrom(backgroundColor: Colors.white);
  ButtonStyle buttonStyle3a =
      ElevatedButton.styleFrom(backgroundColor: Colors.white);
  ButtonStyle buttonStyle4a =
      ElevatedButton.styleFrom(backgroundColor: Colors.white);
  ButtonStyle buttonStyle1 =
      ElevatedButton.styleFrom(backgroundColor: Colors.black);
  ButtonStyle buttonStyle2 =
      ElevatedButton.styleFrom(backgroundColor: Colors.white);
  ButtonStyle buttonStyle3 =
      ElevatedButton.styleFrom(backgroundColor: Colors.white);
  ButtonStyle buttonStyle4 =
      ElevatedButton.styleFrom(backgroundColor: Colors.white);

  TextStyle isActivated = TextStyle(color: Colors.white);
  TextStyle isNotActivated = TextStyle(color: Colors.grey);
  ButtonStyle ButtonIsNotActive =
      ElevatedButton.styleFrom(backgroundColor: Colors.white);
  ButtonStyle ButtonIsActive = ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
  );
  ButtonStyle buttonStyle =
      ElevatedButton.styleFrom(backgroundColor: Colors.white);
  late Future<List<DataModel>> current;
  int volume = 200;
  String number = "";
  Future<List<DataModel>> displayContent(String key) async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final database = FirebaseDatabase.instance.ref();
    var snapshot = await database.child(key).get();
    var values = json.encode(snapshot.value);
    var items = json.decode(values) as List<dynamic>;
    var pos = items.map((e) => DataModel.fromJson(e)).toList();
    print(pos);
    return pos;
  }

  Future<List<Order>> getOrderes(number) async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final database = FirebaseDatabase.instance.ref();
    var snapshot = await database.child(number).get();
    var values = json.encode(snapshot.value);

    var items = json.decode(values) as List<dynamic>;

    var pos = items.map((e) => Order.fromJson(e)).toList();
    print(pos);
    return pos;
  }

  String location = "";
  Future checkPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    number = await prefs.getString('number')!;
    location = await prefs.getString("location")!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    current = displayContent("coffee");
    checkPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(children: [
                Padding(padding: EdgeInsets.only(top: 60)),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 10)),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MarkerMap()));
                          },
                          icon: Image.asset("assets/Color=black.png")),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Coffee shop address"),
                          Text(
                            location,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(255, 230, 115, 115),
                          Color(0xff5b0060),
                          Color(0xff870160),
                          Color(0xffac255e),
                          Color(0xffca485c),
                          Color(0xffe16b5c),
                          Color(0xfff39060),
                          Color(0xffffb56b),
                        ],
                      )),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [SvgPicture.asset("assets/Main list.svg")]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(255, 230, 115, 115),
                          Color(0xff5b0060),
                          Color(0xff870160),
                          Color(0xffac255e),
                          Color(0xffca485c),
                          Color(0xffe16b5c),
                          Color(0xfff39060),
                          Color(0xffffb56b),
                        ],
                      )),
                      child: Row(
                          children: [SvgPicture.asset("assets/Main list.svg")]),
                    )
                  ]),
                ),
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              style: buttonStyle1,
                              onPressed: () async {
                                setState(() {
                                  buttonStyle2 = ButtonIsNotActive;
                                  textStyle2 = isNotActivated;
                                  buttonStyle1 = ButtonIsActive;
                                  textStyle1 = isActivated;

                                  buttonStyle3 = ButtonIsNotActive;
                                  textStyle3 = isNotActivated;
                                  buttonStyle4 = ButtonIsNotActive;
                                  textStyle4 = isNotActivated;
                                });
                                current = displayContent("coffee");
                                setState(() {});
                              },
                              child: Text(
                                "Coffee",
                                style: textStyle1,
                              )),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          ElevatedButton(
                              style: buttonStyle2,
                              onPressed: () async {
                                buttonStyle1 = ButtonIsNotActive;
                                textStyle1 = isNotActivated;
                                buttonStyle2 = ButtonIsActive;
                                textStyle2 = isActivated;
                                buttonStyle3 = ButtonIsNotActive;
                                textStyle3 = isNotActivated;
                                buttonStyle4 = ButtonIsNotActive;
                                textStyle4 = isNotActivated;
                                current = displayContent("tea");
                                setState(() {});
                              },
                              child: Text(
                                "Tea",
                                style: textStyle2,
                              )),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          ElevatedButton(
                              style: buttonStyle3,
                              onPressed: () {
                                buttonStyle1 = ButtonIsNotActive;
                                textStyle1 = isNotActivated;
                                buttonStyle2 = ButtonIsNotActive;
                                textStyle2 = isNotActivated;
                                buttonStyle3 = ButtonIsActive;
                                textStyle3 = isActivated;
                                buttonStyle4 = ButtonIsNotActive;
                                textStyle4 = isNotActivated;
                                current = displayContent("Drinks");
                                setState(() {});
                              },
                              child: Text(
                                "Drinks",
                                style: textStyle3,
                              )),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          ElevatedButton(
                              style: buttonStyle4,
                              onPressed: () {
                                buttonStyle1 = ButtonIsNotActive;
                                textStyle1 = isNotActivated;
                                buttonStyle2 = ButtonIsNotActive;
                                textStyle2 = isNotActivated;
                                buttonStyle3 = ButtonIsNotActive;
                                textStyle3 = isNotActivated;
                                buttonStyle4 = ButtonIsActive;
                                textStyle4 = isActivated;
                                current = displayContent("Desserts");
                                setState(() {});
                              },
                              child: Text(
                                "Deserts",
                                style: textStyle4,
                              )),
                        ]),
                  )),
            ),
            Container(
              child: FutureBuilder(
                future: current,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var items = snapshot.data as List<DataModel>;
                    return Wrap(spacing: 15, runSpacing: 15, children: [
                      for (int i = 0; i < items.length; i++)
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 2)
                              ]),
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Column(children: [
                            Image.asset(items[i].icon.toString()),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(items[i].name.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text("from ${items[i].price} руб."),
                            ElevatedButton(
                              onPressed: () {
                                showGeneralDialog(
                                  context: context,
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return AlertDialog(
                                      insetPadding: EdgeInsets.only(top: 60),
                                      content: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        child: Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                      "assets/Vector.png")),
                                              Text(
                                                items[i].name.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                          content:
                                                              Text("fdsfs"));
                                                    },
                                                  );
                                                },
                                                icon: Icon(Icons.info_outline),
                                              ),
                                            ],
                                          ),
                                          Image.asset(
                                            items[i].icon.toString(),
                                            scale: 0.599,
                                          ),
                                          Container(
                                            child: Text(
                                              items[i].desc.toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 10)),
                                          Row(
                                            children: [
                                              Text(
                                                "Volume",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              )
                                            ],
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 10)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: ElevatedButton(
                                                    style: buttonStyle1a,
                                                    onPressed: () {
                                                      buttonStyle1a =
                                                          ButtonIsActive;
                                                      textStyle1a = isActivated;
                                                      buttonStyle2a =
                                                          ButtonIsNotActive;
                                                      textStyle2a =
                                                          isNotActivated;
                                                      buttonStyle1a =
                                                          ButtonIsNotActive;
                                                      textStyle1a =
                                                          isNotActivated;
                                                      volume = 200;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      "200 ml",
                                                      style: textStyle1a,
                                                    )),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10)),
                                              SizedBox(
                                                width: 100,
                                                child: ElevatedButton(
                                                    style: buttonStyle2a,
                                                    onPressed: () {
                                                      buttonStyle2a =
                                                          ButtonIsActive;
                                                      textStyle2a = isActivated;
                                                      buttonStyle1a =
                                                          ButtonIsNotActive;
                                                      textStyle1a =
                                                          isNotActivated;
                                                      buttonStyle3a =
                                                          ButtonIsNotActive;
                                                      textStyle3a =
                                                          isNotActivated;
                                                      volume = 300;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      "300 ml",
                                                      style: textStyle2a,
                                                    )),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              SizedBox(
                                                width: 100,
                                                child: ElevatedButton(
                                                    style: buttonStyle3a,
                                                    onPressed: () {
                                                      buttonStyle3a =
                                                          ButtonIsActive;
                                                      textStyle3a = isActivated;
                                                      buttonStyle1a =
                                                          ButtonIsNotActive;
                                                      textStyle1a =
                                                          isNotActivated;
                                                      buttonStyle2a =
                                                          ButtonIsNotActive;
                                                      textStyle2a =
                                                          isNotActivated;
                                                      volume = 400;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      "400 ml",
                                                      style: textStyle3a,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 30)),
                                          Row(
                                            children: [
                                              Text(
                                                "Change components",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              )
                                            ],
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(children: [
                                              InkWell(
                                                child: Column(children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 223, 223, 223),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Image.asset(
                                                      "assets/FlatWhite.png",
                                                      height: 100,
                                                    ),
                                                  ),
                                                  Text("Expresso Arabica"),
                                                ]),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                              ),
                                              InkWell(
                                                child: Column(children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 223, 223, 223),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Image.asset(
                                                      "assets/FlatWhite.png",
                                                      height: 100,
                                                    ),
                                                  ),
                                                  Text("Expresso Arabica"),
                                                ]),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                              ),
                                              InkWell(
                                                child: Column(children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 223, 223, 223),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Image.asset(
                                                      "assets/FlatWhite.png",
                                                      height: 100,
                                                    ),
                                                  ),
                                                  Text("Expresso Arabica"),
                                                ]),
                                              ),
                                            ]),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 50)),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                40,
                                            height: 40,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.orange),
                                              onPressed: () async {
                                                DatabaseReference ref =
                                                    FirebaseDatabase.instance
                                                        .ref("${number}");
                                                ;
                                                await ref.push().set({
                                                  "name": items[i].name,
                                                  "price": items[i].price,
                                                  "icon": items[i].icon,
                                                  "volume": volume,
                                                  "status": "0"
                                                });
                                              },
                                              child: Text(
                                                  "Add to cart ${items[i].price}"),
                                            ),
                                          )
                                        ]),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Select",
                                style: TextStyle(color: Colors.orange),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(
                                      width: 2, color: Colors.orange)),
                            )
                          ]),
                        )
                    ]);
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10))
          ],
        ),
      ),
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
            if (value == 1) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Orderes(
                        number: number,
                      )));
            }
          }),
    );
  }
}
