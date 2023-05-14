import 'package:app/AwaitForEmail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration extends StatefulWidget {
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _value = false;
  bool signIn = false;
  String number = "";
  late FocusNode myFocusNode;
  ButtonStyle ButtonIsNotActive =
      ElevatedButton.styleFrom(backgroundColor: Colors.grey);
  ButtonStyle ButtonIsActive =
      ElevatedButton.styleFrom(backgroundColor: Colors.orange);
  ButtonStyle buttonStyle =
      ElevatedButton.styleFrom(backgroundColor: Colors.grey);
  Future savePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('number', number);
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign in",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Center(
          child: Container(
        height: 600,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(padding: EdgeInsets.only(top: 10)),
          Padding(padding: EdgeInsets.only(top: 40)),
          SvgPicture.asset("assets/Illustration.svg"),
          Padding(padding: EdgeInsets.only(top: 20)),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Phone"),
              Padding(padding: EdgeInsets.only(top: 5)),
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    number = value;
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              )
            ]),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 40),
            child: Row(
              children: [
                Checkbox(
                  activeColor: Colors.black,
                  value: _value,
                  onChanged: (value) async {
                    print(_value);
                    if (_value == false) {
                      setState(() {
                        _value = true;
                        buttonStyle = ButtonIsActive;
                      });
                    } else {
                      setState(() {
                        _value = false;
                        buttonStyle = ButtonIsNotActive;
                      });
                    }
                  },
                ),
                Text("i'm agree with privacy policy and user-agreement"),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  if (_value == true) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AwaitForEmail(
                              number: number,
                            )));
                  }
                },
                child: Text("Sign in")),
          ),
        ]),
      )),
    );
  }
}
