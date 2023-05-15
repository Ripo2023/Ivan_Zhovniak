import 'package:app/MainInterface.dart';
import 'package:app/registartion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: MyHome(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String image = "assets/Frame 397.svg";
  String Header = "Hello!";
  String desc =
      "Coffe to Go is an application in which you can order coffer online and pick it up at the coffee shop closest to you. Now let's tell you how it works";
  double point = 0;
  Future checkPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var code = await prefs.getString('code');
    var number = await prefs.getString('number');
    if (code != null || code != "") {
      return false;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = Center(
        child: Container(
      height: 600,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(padding: EdgeInsets.only(top: 60)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Registration()));
                },
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.orange),
                )),
            Padding(padding: EdgeInsets.only(right: 20)),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 40)),
        SvgPicture.asset(image),
        Text(
          Header,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        Container(
          child: Text(desc,
              textAlign: TextAlign.center,
              style: TextStyle(color: HexColor("#808080"))),
          width: 300,
        ),
      ]),
    ));
    return Scaffold(
        body: FutureBuilder(
      future: checkPrefs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == false) {
            return Column(children: [
              screen,
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 150,
                  child: Column(children: [
                    DotsIndicator(
                      dotsCount: 4,
                      position: point,
                      decorator: DotsDecorator(
                        colors: [
                          Colors.grey,
                          Colors.grey,
                          Colors.grey,
                          Colors.grey,
                        ], // Inactive dot colors
                        activeColors: [
                          Colors.orange,
                          Colors.orange,
                          Colors.orange,
                          Colors.orange
                        ], // Àctive dot colors
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          onPressed: () {
                            if (point == 0) {
                              image = "assets/270-GPS.svg";
                              Header = "Search for a coffe shop";
                              desc =
                                  "The map shows the nearest coffe shops to you, choose the most convinient one for you. The app will tell you how long to go to it";
                              point += 1;
                              setState(() {});
                            } else {
                              if (point == 1) {
                                image = "assets/184-Hypster-Barista.svg";
                                Header = "Making an order";
                                desc =
                                    "Choose your favorite drinks and deserts. You can change their composition and choose the time when it will be convinient for you to pick them up";
                                point += 1;
                                setState(() {});
                              } else {
                                if (point == 2) {
                                  image = "assets/142-Reading-Book.svg";
                                  Header = "Receiving an order";
                                  desc =
                                      "At the specified time, come to the coffe shop and enjoy the taste of coffe, without queuing and wasting";
                                  point += 1;
                                  setState(() {});
                                } else {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Registration()));
                                }
                              }
                            }
                          },
                          child: Text("Next")),
                    )
                  ]),
                ),
              )
            ]);
          } else {
            return MainInterface();
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }
}
