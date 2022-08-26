import 'package:carousel_slider/carousel_slider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:travellingVendeur/components/CappBar.dart';
import 'package:travellingVendeur/components/VoyageComponent.dart';
import 'package:travellingVendeur/components/agenceComponent.dart';
import 'package:travellingVendeur/components/button.dart';
import 'package:travellingVendeur/components/customBtn.dart';
import 'package:travellingVendeur/components/formComponent2.dart';
import 'package:travellingVendeur/components/infoContent.dart';
import 'package:travellingVendeur/components/noterAppComponent.dart';
import 'package:travellingVendeur/components/placeComponent.dart';
import 'package:travellingVendeur/components/townComponet.dart';
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:travellingVendeur/styles/textStyle.dart';
import 'package:travellingVendeur/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:travellingVendeur/utils/Services/routing.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AcheterBillet extends StatefulWidget {
  const AcheterBillet({Key? key}) : super(key: key);

  @override
  _AcheterBilletState createState() => _AcheterBilletState();
}

class _AcheterBilletState extends State<AcheterBillet> {
  int counter = 0;
  String selectedId = '';
  // ignore: must_call_super
  initState() {
    counter = 0;
    ViewFunctions().verifiedConnection();
  }

  String selectVoyage = 'Voyage 1';

  // List of items in our dropdown menu
  var _listVoyage = [
    'Voyage 1',
    'Voyage 2',
    'Voyage 3',
    'Voyage 4',
    'Voyage 5',
    'Voyage 6',
  ];

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Container(
        // alignment: Alignment.center,
        padding: EdgeInsets.only(left: Get.width * .02, right: Get.width * .02),
        //  margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),

        decoration:
            BoxDecoration(gradient: GradientApp.blueR, borderRadius: radius),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: kMarginTop),
              child: Column(
                children: [
                  Text('Choisissez un voyage de votre point de vente'),
                  Container(
                      width: Get.width,
                      margin: EdgeInsets.only(top: kMarginTop / 2),
                      padding: EdgeInsets.only(
                        left: Get.width * .08,
                        right: Get.width * .08,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        value: selectVoyage,

                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: _listVoyage.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            selectVoyage = newValue!;
                          });
                        },
                      ))
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: kMarginTop / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // padding: const EdgeInsets.all(20.0),
                      child: InfoContent(
                          title: 'Agence Point de vente', content: "Pk8"),
                    ),
                    Expanded(
                        // padding: const EdgeInsets.all(20.0),
                        child: InfoContent(
                            marginBool: true,
                            title: 'Trajet',
                            content: "Douala - Yaounde")),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: kMarginTop / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // padding: const EdgeInsets.all(20.0),
                      child: FormComponent2(
                        icon: Icons.account_circle,
                        type: 0,
                        // controller: name,
                        enabled: true,
                        hint: "Nom du Client",
                      ),
                    ),
                    Expanded(
                      child: FormComponent2(
                        marginBool: true,
                        icon: Icons.account_circle,
                        type: 0,
                        // controller: name,
                        enabled: true,
                        hint: "Prenom du Client",
                      ),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: kMarginTop / 4),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FormComponent2(
                        icon: Icons.account_circle,
                        type: 0,
                        // controller: name,
                        enabled: true,
                        hint: "Phone",
                      ),
                    ),
                    Expanded(
                      child: FormComponent2(
                        marginBool: true,

                        icon: Icons.account_circle,
                        type: 0,
                        // controller: name,
                        enabled: true,
                        hint: "CNI",
                      ),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: kMarginTop / 2),
                padding: EdgeInsets.only(
                  right: Get.size.width * .002,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Choisir une place pour votre client :'),
                    Container(child: Text(selectedId.toString())),
                    Button(
                        borderRadius: 15.0,
                        width: Get.size.width * .5,
                        height: Get.size.height * .08,
                        loaderColor: Colors.white,
                        title: "choisir",
                        textColor: Colors.white,
                        itemColor: Colors.blue,
                        borderColor: Colors.white,
                        // state: validator,
                        enabled: true,
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          // color: Colors.blue,
                                          decoration: BoxDecoration(
                                              gradient: GradientApp.blueG,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                              )),
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                        'Choisissez votre place parmi celles disponibles'),
                                                    IconButton(
                                                        icon: Icon(
                                                          Icons.close,
                                                          color: Colors.black,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                  ])
                                            ],
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                              top: Get.size.height * .020,
                                              bottom: Get.size.height * .020,
                                              left: Get.size.width * .020,
                                              right: Get.size.width * .020,
                                            ),
                                            decoration: BoxDecoration(
                                              gradient: GradientApp.blueG,
                                            ),
                                            child: SizedBox(
                                                height: Get.size.height * .7,
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    // implement GridView.builder
                                                    child: GridView.builder(
                                                        gridDelegate:
                                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                                                maxCrossAxisExtent:
                                                                    65,
                                                                childAspectRatio:
                                                                    7 / 3,
                                                                crossAxisSpacing:
                                                                    10,
                                                                mainAxisSpacing:
                                                                    10),
                                                        itemCount: 70,
                                                        itemBuilder:
                                                            (BuildContext ctx,
                                                                index) {
                                                          return PlaceComponent(
                                                              place: index + 1,
                                                              selectedId:
                                                                  selectedId,
                                                              onTap: () {
                                                                setState(() {
                                                                  selectedId =
                                                                      (index +
                                                                              1)
                                                                          .toString();
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                                print(
                                                                    selectedId);
                                                              });
                                                        })))),
                                      ],
                                    ));
                              });
                        }),
                  ],
                )),
            Button(
                margin: EdgeInsets.only(top: kMarginTop / 2),
                borderRadius: 15.0,
                width: Get.size.width,
                height: Get.size.height * .08,
                loaderColor: Colors.white,
                title: "Valider",
                textColor: Colors.white,
                itemColor: Colors.green,
                borderColor: Colors.transparent,
                // state: validator,
                enabled: true,
                onTap: () async {
                  print('choisir');
                }),
          ],
        ));
  }
}
