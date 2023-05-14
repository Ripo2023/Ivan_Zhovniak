import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'firebase_options.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';

class AwaitForEmail extends StatefulWidget {
  AwaitForEmail({super.key, required this.number});
  String? number;
  @override
  State<AwaitForEmail> createState() => _AwaitForEmail();
}

class _AwaitForEmail extends State<AwaitForEmail> {
  bool _value = false;
  bool signIn = false;
  String code = "";

  late FocusNode myFocusNode;
  ButtonStyle ButtonIsNotActive =
      ElevatedButton.styleFrom(backgroundColor: Colors.grey);
  ButtonStyle ButtonIsActive =
      ElevatedButton.styleFrom(backgroundColor: Colors.orange);
  ButtonStyle buttonStyle =
      ElevatedButton.styleFrom(backgroundColor: Colors.grey);
  Future SignIn() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // print("fdsfsdf");
    // DatabaseReference ref =
    //     FirebaseDatabase.instance.ref("users/${widget.number.toString()}");
    // await ref.set({
    //   "phone": widget.number.toString(),
    //   "code": "123",
    // });
    // final database = FirebaseDatabase.instance.reference();
    // var snapshot = await database.child("users").get();
    // if (snapshot.exists) {
    //   print(snapshot.value);
    // } else {
    //   print('No data available.');
    // }
  }

  Future savePrefs(String number, String code) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('code', code);
    await prefs.setString('number', number);
  }

  @override
  void initState() {
    super.initState();
    //sendEmail();
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
              Text("Code"),
              Padding(padding: EdgeInsets.only(top: 5)),
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    code = value;
                    if (code.length != 0) {
                      setState(() {
                        buttonStyle = ButtonIsActive;
                      });
                    } else {
                      setState(() {
                        buttonStyle = ButtonIsNotActive;
                      });
                    }
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              )
            ]),
          ),
          ConstrainedBox(constraints: BoxConstraints(minHeight: 40)),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  if (code == "123") {
                    print("OKKK");
                    savePrefs(widget.number.toString(), code);
                    SignIn();
                  }
                },
                child: Text("Sign in")),
          ),
        ]),
      )),
    );
  }
}
