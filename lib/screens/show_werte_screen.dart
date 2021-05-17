import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefs_demo_app/model/werte.dart';

class ShowWerteScreen extends StatefulWidget {
  @override
  _ShowWerteScreenState createState() => _ShowWerteScreenState();
}

class _ShowWerteScreenState extends State<ShowWerteScreen> {
  Werte werte = Werte(data: "der string", wert: 42);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("der aktuelle wert"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _holDieDaten();
                });
              },
              child: Text("hol' die Daten"),
            ),
            Container(
              child: Text(
                  "Werte hat den folgenden Inhalt: ${werte.data}, ${werte.wert}"),
            ),
          ],
        ),
      ),
    );
  }

  void _holDieDaten() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = prefs.getString("meinJson") ?? "{}";
    werte = werteFromJson(json); // hat den String geparst
    print (werte.data);
    print (werte.wert);
  }
}
