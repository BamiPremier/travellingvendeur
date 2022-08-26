import 'package:carousel_slider/carousel_slider.dart';
import 'package:travellingVendeur/Views/HomeView/AjouterServeuse.dart';
import 'package:travellingVendeur/Views/HomeView/ListReservationScreen.dart';
import 'package:travellingVendeur/Views/HomeView/ListReservationSimpleScreen.dart';
import 'package:travellingVendeur/Views/HomeView/SettingScreen.dart';
import 'package:travellingVendeur/Views/HomeView/AcheterBillet.dart';
import 'package:travellingVendeur/components/optionComponent.dart';
import 'package:travellingVendeur/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:travellingVendeur/components/CappBar.dart';
import 'package:travellingVendeur/components/VoyageComponent.dart';
import 'package:travellingVendeur/components/agenceComponent.dart';
import 'package:travellingVendeur/components/button.dart';
import 'package:travellingVendeur/components/customBtn.dart';
import 'package:travellingVendeur/components/formComponent.dart';
import 'package:travellingVendeur/components/noterAppComponent.dart';
import 'package:travellingVendeur/components/placeComponent.dart';
import 'package:travellingVendeur/components/townComponet.dart';
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:travellingVendeur/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:travellingVendeur/utils/Services/routing.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int counter = 0;
  String selectedId = '';

  bool choise0 = true;
  bool choise1 = false;
  bool choise2 = false;
  bool choise3 = false;
  bool choise4 = false;
  bool choise5 = false;
  // ignore: must_call_super
  initState() {
    counter = 0;

    ViewFunctions().verifiedConnection();
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
                      child: Column(
                        children: [
                          OptionComponent(
                              title: 'Achat de billet',
                              selected: choise0,
                              onTap: () {
                                print('ccc');
                                setState(() {
                                  choise0 = true;
                                  choise1 = false;
                                  choise2 = false;
                                  choise3 = false;
                                  choise4 = false;
                                  choise5 = false;
                                });
                              }),
                          OptionComponent(
                              title: 'Liste Toutes les Ventes',
                              selected: choise1,
                              onTap: () {
                                setState(() {
                                  choise0 = false;
                                  choise1 = true;
                                  choise2 = false;
                                  choise3 = false;
                                  choise4 = false;
                                  choise5 = false;
                                });
                              }),
                          OptionComponent(
                              title: 'Liste des Ventes Serveuse',
                              selected: choise2,
                              onTap: () {
                                setState(() {
                                  choise0 = false;
                                  choise2 = true;
                                  choise1 = false;
                                  choise3 = false;
                                  choise4 = false;
                                  choise5 = false;
                                });
                              }),
                          OptionComponent(
                              title: 'Ajouter Serveuse',
                              selected: choise3,
                              onTap: () {
                                setState(() {
                                  choise0 = false;
                                  choise1 = false;
                                  choise3 = true;
                                  choise2 = false;
                                  choise4 = false;
                                  choise5 = false;
                                });
                              }),
                          OptionComponent(
                              title: 'Gerer Serveuse',
                              selected: choise4,
                              onTap: () {
                                setState(() {
                                  choise0 = false;
                                  choise1 = false;
                                  choise4 = true;
                                  choise3 = false;
                                  choise4 = false;
                                  choise5 = false;
                                });
                              }),
                          OptionComponent(
                              title: 'Imprimer Listing',
                              selected: choise5,
                              onTap: () {
                                setState(() {
                                  choise0 = false;
                                  choise1 = false;
                                  choise5 = true;
                                  choise2 = false;
                                  choise4 = false;
                                  choise3 = false;
                                });
                              }),
                        ],
                      )),
                  Container(
                      width: Get.width * .8,
                      height: Get.height,
                      // padding: EdgeInsets.only(
                      //     left: Get.width * .08, right: Get.width * .08),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          (choise0)
                              ? AcheterBillet()
                              : (choise1)
                                  ? ListReservationScreen()
                                  : (choise2)
                                      ? ListReservationSimpleScreen()
                                      : (choise3)
                                          ? AjouterServeuse()
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
