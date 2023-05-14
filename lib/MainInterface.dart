import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'DataModel.dart';

class MainInterface extends StatefulWidget {
  @override
  State<MainInterface> createState() => _MainInterfaceState();
}

class _MainInterfaceState extends State<MainInterface> {
  TextStyle textStyle1 = TextStyle(color: Colors.white);
  TextStyle textStyle2 = TextStyle(color: Colors.grey);
  TextStyle textStyle3 = TextStyle(color: Colors.grey);
  TextStyle textStyle4 = TextStyle(color: Colors.grey);

  TextStyle textStyle1a = TextStyle(color: Colors.white);
  TextStyle textStyle2a = TextStyle(color: Colors.grey);
  TextStyle textStyle3a = TextStyle(color: Colors.grey);
  TextStyle textStyle4a = TextStyle(color: Colors.grey);

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
  List<DataModel>? coffee;

  // Future displayContent(String key) async {
  //   coffee.add(Da)
  // }

  @override
  void initState() {
    super.initState();
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
                        Image.asset("assets/Color=black.png"),
                        Padding(padding: EdgeInsets.only(right: 5)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Coffee shop address"),
                            Text(
                              "43, Marathon st.",
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
                            children: [
                              SvgPicture.asset("assets/Main list.svg")
                            ]),
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
                        child: Row(children: [
                          SvgPicture.asset("assets/Main list.svg")
                        ]),
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
                child: Wrap(spacing: 15, runSpacing: 15, children: [
                  for (int i = 0; i < 4; i++)
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: Column(children: [
                        Image.asset("assets/FlatWhite.png"),
                        Text("from 180 руб."),
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
                                        MediaQuery.of(context).size.width - 20,
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Align(
                                          //   alignment: Alignment.topLeft,
                                          //   child: IconButton(
                                          //       onPressed: () {},
                                          //       icon: Image.asset(
                                          //           "assets/Vector.png")),
                                          // ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Center(
                                              child: Text(
                                                "Cappuchino",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        "assets/FlatWhite.png",
                                        scale: 0.599,
                                      ),
                                      Container(
                                        child: Text(
                                          "Expresso-based coffe with the addition of warmed foamed milk",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 10)),
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
                                          padding: EdgeInsets.only(top: 10)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: ElevatedButton(
                                                style: buttonStyle1a,
                                                onPressed: () {},
                                                child: Text(
                                                  "200 ml",
                                                  style: textStyle1a,
                                                )),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10)),
                                          SizedBox(
                                            width: 100,
                                            child: ElevatedButton(
                                                style: buttonStyle2a,
                                                onPressed: () {},
                                                child: Text(
                                                  "300 ml",
                                                  style: textStyle2a,
                                                )),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10)),
                                          SizedBox(
                                            width: 100,
                                            child: ElevatedButton(
                                                style: buttonStyle3a,
                                                onPressed: () {},
                                                child: Text(
                                                  "400 ml",
                                                  style: textStyle3a,
                                                )),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 30)),
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
                                              Image.asset(
                                                  "assets/FlatWhite.png"),
                                              Text("Expresso Arabica"),
                                            ]),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                          ),
                                          InkWell(
                                            child: Column(children: [
                                              Image.asset(
                                                  "assets/FlatWhite.png"),
                                              Text("Expresso Arabica"),
                                            ]),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                          ),
                                          InkWell(
                                            child: Column(children: [
                                              Image.asset(
                                                  "assets/FlatWhite.png"),
                                              Text("Expresso Arabica"),
                                            ]),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                          ),
                                          InkWell(
                                            child: Column(children: [
                                              Image.asset(
                                                  "assets/FlatWhite.png"),
                                              Text("Expresso Arabica"),
                                            ]),
                                          ),
                                        ]),
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
                              side: BorderSide(width: 2, color: Colors.orange)),
                        )
                      ]),
                    )
                ]),
              ),
            ],
          ),
        ));
  }
}
