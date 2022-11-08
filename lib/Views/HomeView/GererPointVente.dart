 
import 'package:travellingVendeur/components/Button/btnCatList.dart';
import 'package:travellingVendeur/components/Button/btnCatListPV.dart';
import 'package:travellingVendeur/components/Button/button.dart'; 
import 'package:travellingVendeur/components/Form/formComponent2.dart';  
import 'package:travellingVendeur/styles/textStyle.dart';
import 'package:travellingVendeur/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 

class GererPointVente extends StatefulWidget {
  const GererPointVente({Key? key}) : super(key: key);

  @override
  _GererPointVenteState createState() => _GererPointVenteState();
}

class _GererPointVenteState extends State<GererPointVente> {
  int counter = 0;
  String selectedId = '';
  // ignore: must_call_super
  initState() {
    counter = 0;
    // ViewFunctions().verifiedConnection();
  }

  String selectVoyage = 'Voyage 1';

  bool focused = false;
  bool nouveau = false;
  bool analyse1 = false;
  bool analyse2 = false;
  bool retour = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        // alignment: Alignment.center,
        margin:
            EdgeInsets.only(left: Get.height * .012, right: Get.height * .012),
        child: SingleChildScrollView(
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
                          margin: EdgeInsets.only(bottom: Get.height * .009),
                          child: Text(
                            'Gerer vos points de ventes',
                            style: TextStyle(
                                fontSize: 16 /* , color: Colors.white */),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                          height: Get.height * .1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BtnCatList(
                                title:
                                    nouveau ? 'Back' : 'Nouveau Point de vente',
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
                                      title: !retour ? 'Analyser' : "Retour",
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
                                      margin:
                                          EdgeInsets.only(top: kMarginTop / 2),
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              // padding: const EdgeInsets.all(20.0),
                                              child: FormComponent2(
                                                icon: Icons.account_circle,
                                                type: 0,
                                                // controller: name,
                                                enabled: true,
                                                hint: "Nom",
                                              ),
                                            ),
                                            Expanded(
                                              child: FormComponent2(
                                                marginBool: true,
                                                icon: Icons.account_circle,
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
                                                icon: Icons.account_circle,
                                                type: 0,
                                                // controller: name,
                                                enabled: true,
                                                hint: "CNI",
                                              ),
                                            ),
                                            Expanded(
                                              child: FormComponent2(
                                                marginBool: true,

                                                icon: Icons.account_circle,
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
                                        borderColor: Colors.transparent,
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
                                          children: [Text('analyse 2')],
                                        )
                                      : Column(
                                          children: [
                                            SizedBox(
                                                height: Get.height * .4,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    btnCatListPV(
                                                      title: 'Douala, pk8',
                                                      onTap: () =>
                                                          print('ffddfd'),
                                                      active: true,
                                                    ),
                                                    btnCatListPV(
                                                      title: 'Tradex , village',
                                                      onTap: () =>
                                                          print('ffddfd'),
                                                      active: false,
                                                    ),
                                                  ],
                                                )),
                                            SizedBox(
                                                height: Get.height * .4,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    btnCatListPV(
                                                      title: 'Bepanda, Tonnere',
                                                      onTap: () =>
                                                          print('ffddfd'),
                                                      active: false,
                                                    ),
                                                    btnCatListPV(
                                                      title: 'Yaounde, Mvan',
                                                      onTap: () =>
                                                          print('ffddfd'),
                                                      active: false,
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ))
                    ])))));
  }
}
