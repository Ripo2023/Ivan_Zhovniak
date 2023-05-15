import 'package:app/MainInterface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarkerMap extends StatefulWidget {
  @override
  State<MarkerMap> createState() => _MarkerMapState();
}

class _MarkerMapState extends State<MarkerMap> {
  String location = "";
  Future setPrefs(location) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("location", location);
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 60)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(width: 2, color: Colors.orange)),
            onPressed: () {
              setPrefs("Cafe 1");
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MainInterface()));
            },
            child: Text(
              "Cafe 1",
              style: TextStyle(color: Colors.orange),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(width: 2, color: Colors.orange)),
            onPressed: () {
              setPrefs("Cafe 2");
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MainInterface()));
            },
            child: Text(
              "Cafe 2",
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      )),
    );
  }
}
