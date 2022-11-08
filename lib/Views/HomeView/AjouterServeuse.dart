 
import 'package:travellingVendeur/components/Button/button.dart'; 
import 'package:travellingVendeur/components/Form/formComponent2.dart';  
import 'package:travellingVendeur/styles/textStyle.dart';
import 'package:travellingVendeur/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 

class AjouterServeuse extends StatefulWidget {
  const AjouterServeuse({Key? key}) : super(key: key);

  @override
  _AjouterServeuseState createState() => _AjouterServeuseState();
}

class _AjouterServeuseState extends State<AjouterServeuse> {
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
        padding: EdgeInsets.only(
            left: Get.width * .02, right: Get.width * .02, top: kMarginTop),
        //  margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),

        // decoration:
        //     BoxDecoration(gradient: GradientApp.blueR, borderRadius: radius),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: kMarginTop),
              child: Text('Entrer les informations de la serveuse'),
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
                        hint: "Email",
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
                margin: EdgeInsets.only(top: kMarginTop / 2),
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
        ));
  }
}
