 
import 'package:travellingVendeur/components/Button/btnCatListVente.dart'; 
import 'package:travellingVendeur/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart'; 

class GererVente extends StatefulWidget {
  const GererVente({Key? key}) : super(key: key);

  @override
  _GererVenteState createState() => _GererVenteState();
}

class _GererVenteState extends State<GererVente> {
  int counter = 0;
  String selectedId = '';
  // ignore: must_call_super
  initState() {
    counter = 0;
    // ViewFunctions().verifiedConnection();
  }

  String selectVoyage = 'Voyage 1';

  bool focused = false;

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
                            'Gerer les ventes',
                            style: TextStyle(
                                fontSize: 16 /* , color: Colors.white */),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                          height: Get.height * .4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BtnCatListVente(
                                title: 'Journaliere',
                                onTap: () => print('ffddfd'),
                                active: true,
                              ),
                              BtnCatListVente(
                                title: 'Par Voyage',
                                onTap: () => print('ffddfd'),
                                active: false,
                              ),
                            ],
                          )),
                      SizedBox(
                          height: Get.height * .4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BtnCatListVente(
                                title: 'Par serveuse',
                                onTap: () => print('ffddfd'),
                                active: false,
                              ),
                              BtnCatListVente(
                                title: 'Par point de vente',
                                onTap: () => print('ffddfd'),
                                active: false,
                              )
                            ],
                          )),
                      SizedBox(
                          height: Get.height * .4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BtnCatListVente(
                                title: 'Par agence',
                                onTap: () => print('ffddfd'),
                                active: false,
                              ),
                              // BtnCatListVente(
                              //   title: 'Par point de vente',
                              //   onTap: () => print('ffddfd'),
                              //   active: false,
                              // )
                            ],
                          )),
                      // SingleChildScrollView(
                      //     child: SizedBox(
                      //   height: Get.height,
                      //   child: ListView.builder(
                      //     itemCount: 20,
                      //     itemBuilder: (ctx, index) => HistoryComponent(),
                      //   ),
                      // ))
                    ])))));
  }
}
