import 'dart:async';

import 'package:travellingVendeur/components/Button/button.dart';
import 'package:travellingVendeur/components/Form/formComponent2.dart';
import 'package:travellingVendeur/components/Widget/LoadingComponent.dart';
import 'package:travellingVendeur/components/Widget/infoContent.dart';
import 'package:travellingVendeur/components/Widget/placeComponent.dart';
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:travellingVendeur/styles/textStyle.dart';
import 'package:travellingVendeur/utils/Services/requestServices.dart';
import 'package:travellingVendeur/utils/functions/formatData.dart';
import 'package:travellingVendeur/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    print('******');
    counter = 0;
    getData();
    // ViewFunctions().verifiedConnection();
  }

  resetData() {
    selectedPlace = '0';
    selectedPlaceId = '0';
    nom.text = '';
    prenom.text = '';
    phone.text = '';
  }

  String selectedPlace = '0';
  String selectedPlaceId = '0';
  var selectVoyage = {
    "id": 1,
    "numeroVoyage": "1",
    "nomVoyage": "G",
    "nombrePlace": 60,
    "nomTrajet": "Yaounde - Bafoussam",
    "pointVente": "General , dssd",
    "typeVoyage": "VIP",
    "heureDepart": "1970-01-01T13:35:59+00:00",
    "place": []
  };

  bool ok = false;
  List _listVoyage = [];
  var index = 0;
  // ignore: must_call_super
  getData() async {
    counter++;
    await new ApiService().getDataVoyagePointVente(1).then((value) {
      setState(() {
        _listVoyage = value;
        print(_listVoyage[0]);
        selectVoyage = _listVoyage[index];
        ok = true;
      });
      Timer(Duration(minutes: 2), () {
        // print('********************${counter}');
        getData();
      });
    }).catchError((e) {
      print('eeeeeeeeeeeeeeeeeeee');

      // ViewFunctions().verifiedConnection();
      // Timer(Duration(seconds: 3), () {
      //   // print('00000***${counter}');
      //   getData();
      // });
      // getData();_listVoyage
    });
  }

  var message = '';
  var message2 = '';
  Color color = ColorsApp.bleuLight;
  var acheteur = '1';
  formatData format = new formatData();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController phone = TextEditingController();
  buyBillet() async {
    if (format.present(nom.value.text) &&
        format.present(prenom.value.text) &&
        format.phoneNumber(phone.value.text) &&
        selectedPlaceId != '0') {
      var data = {
        "nom": nom.value.text,
        "prenom": prenom.value.text,
        "numero": phone.value.text,
        "idPlace": selectedPlaceId,
        "acheteur": acheteur,
      };

      Get.defaultDialog(
          title: 'En cours',
          content: SizedBox(
              // height: Get.size.height * .02,
              // width: Get.size.width * .02,
              child: Center(
                  child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ))));
      await new ApiService().buyBillet(data).then((value) {
        setState(() {
          // finish = true;
          message = value['message'];

          color = value['color'];
          if (value['status'] == 203) {
            selectedPlace = '0';
            selectedPlaceId = '0';
          } else {
            resetData();
          }
        });
        getData();
        Get.back();
        functions.snackBar('Reservation', message, color);
        print(message);
        // functions.snackBar('Reservation', 'cccccccccccc', ColorsApp.skyBlue, 2);
      }).catchError((e) {
        Get.back();
        setState(() {
          // finish = true;
          message = 'Echec de Reservation ';
          color = ColorsApp.red;
        });
        print(message);

        functions.snackBar('Reservation', 'Echec de Reservation ', Colors.red);
        //  // getData();
      });
    } else {
      functions.snackBar('Champs',
          'Veuillez remplir tous les champs correctements', Colors.red);
    }
  }

  ViewFunctions functions = new ViewFunctions();
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return !ok
        ? new LoadingComponent().data
        : Container(
            // alignment: Alignment.center,
            padding:
                EdgeInsets.only(left: Get.width * .02, right: Get.width * .02),
            //  margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),

            // decoration:
            //     BoxDecoration(gradient: GradientApp.blueR, borderRadius: radius),
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
                            items: _listVoyage
                                .map((items) => DropdownMenuItem(
                                      value: items,
                                      child: Text(items['nomVoyage']),
                                    ))
                                .toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (newValue) {
                              setState(() {
                                selectVoyage = newValue as Map<String, Object>;
                                print(selectVoyage);
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
                              title: 'Agence Point de vente',
                              content:
                                  this.selectVoyage['pointVente'] as String),
                        ),
                        Expanded(
                          // padding: const EdgeInsets.all(20.0),
                          child: InfoContent(
                              marginBool: true,
                              title: 'Trajet',
                              content:
                                  this.selectVoyage['nomTrajet'] as String),
                        ),
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
                            controller: nom,
                            enabled: true,
                            hint: "Nom du Client",
                          ),
                        ),
                        Expanded(
                          child: FormComponent2(
                            marginBool: true,
                            icon: Icons.account_circle,
                            type: 0,
                            controller: prenom,
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
                            controller: phone,
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
                        Text(
                            'Choisir une place pour votre client :  ${selectedPlace}'),
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20.0),
                                                    topLeft:
                                                        Radius.circular(20.0),
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
                                                              color:
                                                                  Colors.black,
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
                                                  bottom:
                                                      Get.size.height * .020,
                                                  left: Get.size.width * .020,
                                                  right: Get.size.width * .020,
                                                ),
                                                decoration: BoxDecoration(
                                                  gradient: GradientApp.blueG,
                                                ),
                                                child: SizedBox(
                                                    height:
                                                        Get.size.height * .7,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        // implement GridView.builder
                                                        child: GridView.builder(
                                                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                                                maxCrossAxisExtent:
                                                                    50,
                                                                childAspectRatio:
                                                                    7 / 3,
                                                                crossAxisSpacing:
                                                                    10,
                                                                mainAxisSpacing:
                                                                    10),
                                                            itemCount:
                                                                (selectVoyage[
                                                                            'place']
                                                                        as List)
                                                                    .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        ctx,
                                                                    index) {
                                                              return PlaceComponent(
                                                                  place: (selectVoyage['place']
                                                                              as List)[
                                                                          index]
                                                                      [
                                                                      'numeroPlace'],
                                                                  status: (selectVoyage[
                                                                              'place'] as List)[
                                                                          index]
                                                                      [
                                                                      'status'],
                                                                  selectedPlace:
                                                                      selectedPlace,
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      if (!(selectVoyage['place']
                                                                              as List)[index]
                                                                          [
                                                                          'status']) {
                                                                        selectedPlace =
                                                                            (selectVoyage['place'] as List)[index]['numeroPlace'].toString();
                                                                        selectedPlaceId =
                                                                            (selectVoyage['place'] as List)[index]['idPlace'].toString();
                                                                        Navigator.pop(
                                                                            context);
                                                                      } else {
                                                                        functions
                                                                            .snackBar(
                                                                          'Place',
                                                                          'Place deja prise',
                                                                          Colors
                                                                              .red,
                                                                        );
                                                                      }
                                                                    });

                                                                    print(
                                                                        selectedPlace);
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
                      // print('choisir');
                      await buyBillet();
                    }),
              ],
            ));
  }
}
