import 'dart:async';
 
import 'package:flutter_spinkit/flutter_spinkit.dart'; 
import 'package:travellingVendeur/components/Button/btnCatList.dart';
import 'package:travellingVendeur/components/Button/button.dart'; 
import 'package:travellingVendeur/components/Form/formComponent2.dart';
import 'package:travellingVendeur/components/Widget/VoyageComponent.dart'; 
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:travellingVendeur/styles/textStyle.dart';
import 'package:travellingVendeur/utils/Services/requestServices.dart';
import 'package:travellingVendeur/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:travellingVendeur/utils/Services/routing.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GererServeuse extends StatefulWidget {
  const GererServeuse({Key? key}) : super(key: key);

  @override
  _GererServeuseState createState() => _GererServeuseState();
}

class _GererServeuseState extends State<GererServeuse> {
  int counter = 0;
  String selectedId = '';
  // ignore: must_call_super
  bool ok1 = false;
  List listVoyageX = [];
  List listDataV = [];
  // ignore: must_call_super
  getData() async {
    counter++;
    await new ApiService().getDataVoyagePointVente(0).then((value) {
      setState(() {
        print(value);
        listVoyageX = value;

        ok1 = true;
      });
      Timer(Duration(seconds: 60), () {
        // print('********************${counter}');
        getData();
      });
    }).catchError((e) {
      // ViewFunctions().verifiedConnection();
      Timer(Duration(seconds: 3), () {
        // print('00000***${counter}');
        getData();
      });
      // getData();
    });
  }

  newVoyage() async {
    setState(() {
      validator = true;
    });
    var vf = new ViewFunctions();
    var data = {};
    var response = await new ApiService().newVoyage(data);
    if (response == true) {
      setState(() {
        validator = false;
      });
      vf.snackBar(
          'Voyage', 'Ajout de votre voyage reussi', ColorsApp.greenLight);
    } else {
      setState(() {
        validator = false;
      });
      vf.snackBar('Voyage', 'Une Erreur est survenue', ColorsApp.red);
    }
  }

  initState() {
    getData();

    counter = 0;
    // ViewFunctions().verifiedConnection();
  }

  TextEditingController nomV = TextEditingController();
  TextEditingController codeV = TextEditingController();
  TextEditingController nmbrePlaceV = TextEditingController();
  // TextEditingController nmbrePlaceV = TextEditingController();
  var _listTypeV = ['Classic', 'VIP'];
  // List of items in our dropdown menu
  var _listVoyage = [
    'Voyage 1',
    'Voyage 2',
    'Voyage 3',
    'Voyage 4',
    'Voyage 5',
    'Voyage 6',
  ];

  String selectVoyage = 'Voyage 1';
  String selectType = 'Classic';

  bool focused = false;
  bool nouveau = false;
  bool analyse1 = false;
  bool analyse2 = false;
  bool retour = false;

  bool validator = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      margin:
          EdgeInsets.only(left: Get.height * .012, right: Get.height * .012),
      child: SingleChildScrollView(
        child: ok1
            ? Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // (!focused) ? CAppBarComponent() : SizedBox(height: 0, width: 0),
                  Container(

                      // alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          left: Get.width * .010,
                          right: Get.width * .010,
                          bottom: Get.height * .02,
                          top: (focused) ? Get.height * .02 : Get.height * .05),
                      child: Row(children: [
                        Flexible(
                            child: SizedBox(
                                height: Get.height * .06,
                                child: new TextFormField(
                                  // controller: widget.controller,
                                  validator: (value) {
                                    return value == ""
                                        ? "veillez remplir se champs"
                                        : null;
                                  },
                                  onTap: () {
                                    setState(() {
                                      focused = true;
                                    });
                                  },
                                  // enabled: widget.enabled,
                                  onChanged: (val) {
                                    setState(() {
                                      focused = true;
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                  // obscureText: widget.type == 1 ? true : false,
                                  decoration: new InputDecoration(
                                    suffixIcon: Icon(Icons.search),
                                    counterText: "",
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        )),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      // borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.only(
                                      left: 15,
                                      bottom: 11,
                                      top: 15,
                                      right: 15,
                                    ),
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ))),
                        (focused)
                            ? TextButton(
                                child: Text('Annuler'),
                                onPressed: () {
                                  setState(() {
                                    focused = false;
                                  });
                                },
                              )
                            : SizedBox(height: 0, width: 0),
                      ])),
                  SingleChildScrollView(
                      child: Container(
                          margin: EdgeInsets.only(bottom: Get.height * .009),
                          padding: EdgeInsets.only(
                              bottom: Get.height * .04,
                              top: Get.height * .01,
                              left: Get.width * .01,
                              right: Get.width * .01),
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.only(
                          //         topLeft: Radius.circular(8),
                          //         topRight: Radius.circular(8)),
                          //     color: Color(0xCA5B79F2)),
                          child: SingleChildScrollView(
                              child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        bottom: Get.height * .009),
                                    child: Text(
                                      'Gerer les Serveuses',
                                      style: TextStyle(
                                          fontSize:
                                              16 /* , color: Colors.white */),
                                      textAlign: TextAlign.center,
                                    )),
                                SizedBox(
                                    height: Get.height * .1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BtnCatList(
                                          title: nouveau
                                              ? 'Back'
                                              : 'Nouvelle Serveuse',
                                          onTap: () => {
                                            setState(() {
                                              nouveau = !nouveau;
                                            })
                                          },
                                          pVal: 0.0,
                                          active: true,
                                        ),
                                        // BtnCatList(
                                        //   title: 'Par Voyage',
                                        //   onTap: () => print('ffddfd'),
                                        //   active: false,
                                        // ),
                                        // BtnCatList(
                                        //   title: 'Mensuelle',
                                        //   onTap: () => print('ffddfd'),
                                        //   active: false,
                                        // ),
                                        !nouveau
                                            ? BtnCatList(
                                                title: !retour
                                                    ? 'Analyser'
                                                    : "Retour",
                                                onTap: () {
                                                  setState(() {
                                                    retour = !retour;
                                                    analyse1 = !analyse1;
                                                    analyse2 = false;
                                                  });
                                                },
                                                pVal: 0.0,
                                                active: false,
                                              )
                                            : Container()
                                      ],
                                    )),
                                nouveau
                                    ? SafeArea(
                                        child: SingleChildScrollView(
                                            child: Column(children: [
                                        Column(children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: kMarginTop / 2),
                                                child: Text(
                                                    'Entrer les informations de la serveuse'),
                                              ),
                                              // Container(
                                              //     margin: EdgeInsets.only(top: kMarginTop / 2),
                                              //     child: Row(
                                              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //       children: [
                                              //         Expanded(
                                              //           // padding: const EdgeInsets.all(20.0),
                                              //           child: InfoContent(
                                              //               title: 'Agence Point de vente', content: "Pk8"),
                                              //         ),
                                              //         Expanded(
                                              //             // padding: const EdgeInsets.all(20.0),
                                              //             child: InfoContent(
                                              //                 marginBool: true,
                                              //                 title: 'Trajet',
                                              //                 content: "Douala - Yaounde")),
                                              //       ],
                                              //     )),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: kMarginTop / 2),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        // padding: const EdgeInsets.all(20.0),
                                                        child: FormComponent2(
                                                          icon: Icons
                                                              .account_circle,
                                                          type: 0,
                                                          // controller: name,
                                                          enabled: true,
                                                          hint: "Nom",
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: FormComponent2(
                                                          marginBool: true,
                                                          icon: Icons
                                                              .account_circle,
                                                          type: 0,
                                                          // controller: name,
                                                          enabled: true,
                                                          hint: "Prenom",
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: kMarginTop / 4),
                                                  child: Row(
                                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: FormComponent2(
                                                          icon: Icons
                                                              .account_circle,
                                                          type: 0,
                                                          // controller: name,
                                                          enabled: true,
                                                          hint: "Phone",
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: FormComponent2(
                                                          marginBool: true,

                                                          icon: Icons
                                                              .account_circle,
                                                          type: 0,
                                                          // controller: name,
                                                          enabled: true,
                                                          hint: "Email",
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: kMarginTop / 4),
                                                  child: Row(
                                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: FormComponent2(
                                                          icon: Icons
                                                              .account_circle,
                                                          type: 0,
                                                          // controller: name,
                                                          enabled: true,
                                                          hint: "CNI",
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: FormComponent2(
                                                          marginBool: true,

                                                          icon: Icons
                                                              .account_circle,
                                                          type: 0,
                                                          // controller: name,
                                                          enabled: true,
                                                          hint: "Password",
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              Button(
                                                  margin: EdgeInsets.only(
                                                      top: kMarginTop / 2),
                                                  borderRadius: 15.0,
                                                  width: Get.size.width,
                                                  height: Get.size.height * .08,
                                                  loaderColor: Colors.white,
                                                  title: "Ajouter Serveuse",
                                                  textColor: Colors.white,
                                                  itemColor: Colors.green,
                                                  borderColor:
                                                      Colors.transparent,
                                                  // state: validator,
                                                  enabled: true,
                                                  onTap: () async {
                                                    print('choisir');
                                                  }),
                                            ],
                                          )
                                        ]),
                                      ])))
                                    : SingleChildScrollView(
                                        child: analyse1
                                            ? Column(
                                                children: [Text('analyse 1')],
                                              )
                                            : analyse2
                                                ? Column(
                                                    children: [
                                                      Text('analyse 2')
                                                    ],
                                                  )
                                                : SizedBox(
                                                    height: Get.height,
                                                    child: ListView.builder(
                                                      itemCount: 20,
                                                      itemBuilder:
                                                          (ctx, index) =>
                                                              VoyageComponent(
                                                        index: index,
                                                        onTap: () {
                                                          setState(() {
                                                            retour = false;
                                                            analyse2 =
                                                                !analyse2;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ))
                              ]))))
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SpinKitCircle(
                      color: Colors.blue,
                      size: 40,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
