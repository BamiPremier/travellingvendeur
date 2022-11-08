import 'package:carousel_slider/carousel_slider.dart';
import 'package:travellingVendeur/Views/HomeView/AjouterServeuse.dart';
import 'package:travellingVendeur/Views/HomeView/GererPointVente.dart';
import 'package:travellingVendeur/Views/HomeView/GererServeuse.dart';
import 'package:travellingVendeur/Views/HomeView/GererVente.dart';
import 'package:travellingVendeur/Views/HomeView/GererVoyage.dart';
import 'package:travellingVendeur/Views/HomeView/ListReservationScreen.dart';
import 'package:travellingVendeur/Views/HomeView/ListReservationSimpleScreen.dart';
import 'package:travellingVendeur/Views/HomeView/SettingScreen.dart';
import 'package:travellingVendeur/Views/HomeView/AcheterBillet.dart';
import 'package:travellingVendeur/components/Widget/optionComponent.dart';
  
import 'package:flutter/material.dart'; 
import 'package:travellingVendeur/styles/colorApp.dart'; 
 
import 'package:get/get.dart'; 
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int counter = 0;
  String selectedId = '';

  var choise0 = 0;
  bool choise1 = false;
  bool choise2 = false;
  bool choise3 = false;
  bool choise4 = false;
  bool choise5 = false;
  // ignore: must_call_super
  initState() {
    counter = 0;

    // ViewFunctions().verifiedConnection();
  }

  String dropdownvalueD = 'Yaounde';
  String dropdownvalueA = 'Yaounde';

  // List of items in our dropdown menu
  var departList = [
    'Yaounde',
    'Douala',
    'Bafoussam',
    'Edea',
    'Dschang',
  ];
  var arriveList = [
    'Yaounde',
    'Douala',
    'Bafoussam',
    'Edea',
    'Dschang',
  ];
  var agenceList = [
    'Finex',
    'General',
    'Buca',
    'Traisor',
    'Dschang',
  ];
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              //     left: Get.width * .08, right: Get.width * .08),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              // margin: EdgeInsets.only(top: Get.height * .08),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: Get.width * .2,
                      height: Get.height,

                      // padding: EdgeInsets.only(
                      //     left: Get.width * .08, right: Get.width * .08),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: SingleChildScrollView(
                          child: Column(children: [
                        OptionComponent(
                            title: 'Achat de billet',
                            selected: (choise0 == 0),
                            onTap: () {
                              setState(() {
                                choise0 = 0;
                              });
                            }),
                        /*   OptionComponent(
                            title: 'Liste Toutes les Ventes',
                            selected: (choise0 == 1),
                            onTap: () {
                              setState(() {
                                choise0 = 1;
                              });
                            }), */
                        OptionComponent(
                            title: 'Historique billets',
                            selected: (choise0 == 2),
                            onTap: () {
                              setState(() {
                                choise0 = 2;
                              });
                            }),
                        OptionComponent(
                            title: 'Gerer Voyage',
                            selected: (choise0 == 4),
                            onTap: () {
                              setState(() {
                                choise0 = 4;
                              });
                            }),
                        OptionComponent(
                            title: 'Gerer Serveuse',
                            selected: (choise0 == 5),
                            onTap: () {
                              setState(() {
                                choise0 = 5;
                              });
                            }),
                        OptionComponent(
                            title: 'Gerer les ventes',
                            selected: (choise0 == 6),
                            onTap: () {
                              setState(() {
                                choise0 = 6;
                              });
                            }),
                        OptionComponent(
                            title: 'Gerer Point de vente',
                            selected: (choise0 == 7),
                            onTap: () {
                              setState(() {
                                choise0 = 7;
                              });
                            }),
                        OptionComponent(
                            title: 'Imprimer un rapport',
                            selected: (choise0 == 8),
                            onTap: () {
                              setState(() {
                                choise0 = 8;
                              });
                            }),
                        OptionComponent(
                            title: 'Parametre',
                            selected: (choise0 == 9),
                            onTap: () {
                              setState(() {
                                choise0 = 9;
                              });
                            }),
                      ]))),
                  Container(
                      width: Get.width * .8,
                      height: Get.height,
                      // padding: EdgeInsets.only(
                      //     left: Get.width * .08, right: Get.width * .08),
                      decoration: BoxDecoration(
                        color: ColorsApp.grey,
                        /* borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)) */
                      ),
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          (choise0 == 0)
                              ? AcheterBillet()
                              /*  : (choise0 == 1)
                                  ? ListReservationScreen() */
                              : (choise0 == 2)
                                  ? ListReservationSimpleScreen()
                                  : (choise0 == 4)
                                      ? GererVoyage()
                                      : (choise0 == 5)
                                          ? GererServeuse()
                                          : (choise0 == 6)
                                              ? GererVente()
                                              : (choise0 == 7)
                                                  ? GererPointVente()
                                                  : (choise0 == 8)
                                                      ? SettingScreen()
                                                      : (choise0 == 9)
                                                          ? SettingScreen()
                                                          : Text('33333')
                        ],
                      ))),
                ],
              )),
        ],
      ),
    )));
  }
}
