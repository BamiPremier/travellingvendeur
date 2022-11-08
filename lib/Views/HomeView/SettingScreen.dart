 
import 'package:flutter/material.dart'; 
import 'package:travellingVendeur/components/Button/themeButton.dart'; 

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool imgBool = false;
  bool disponible = false;
  Map data = {};
  String id = '';
  @override
  void initState() {
    // ApiService.getCurrentUser().then((value) {
    //   setState(() {
    //     disponible = true;
    //     data = value;
    //   });
    // });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Column(children: [
      Container(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  child: ThemeButtonWidget(),
                  padding: EdgeInsets.only(right: 10),
                ),
              ]),
              // disponible
              //     ?

              Text('Personnaliser agence'),
              Text('Personnaliser point de vente'),
            ],
          ))
    ]));
  }
}
