import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefs_demo_app/screens/show_werte_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: ElevatedButton(
                child: Text("Zeig mir die Werte"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowWerteScreen()),
                  );
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text("Noch einen druff ..."),
                onPressed: _einenDrauf,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _einenDrauf() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int zaehler = prefs.getInt("meinZaehler") ?? 0;
    String json = prefs.getString("meinJson") ?? "{}";
    zaehler += 1;
    print("Der wert ist ${zaehler}");
    print(json);
    await prefs.setInt("meinZaehler", zaehler);
    await prefs.setString("meinJson",
        "{\"data\": \"Ein JSON String ${zaehler}\", \"wert\": ${zaehler}}");
  }
}
