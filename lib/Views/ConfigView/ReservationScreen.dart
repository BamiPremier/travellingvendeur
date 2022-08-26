import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:travellingVendeur/components/CappBar.dart';
import 'package:travellingVendeur/components/HistoryComponent.dart';
import 'package:travellingVendeur/components/InfoReservationComp.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onTap: () => Get.back()),
          title: Text(
            'Informations sur reservation',
            style: TextStyle(color: Colors.black),
          ),
          foregroundColor: Colors.red,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body:
            /* Container(
            // alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: Get.width * .012, right: Get.width * .012),
            child: */
            SingleChildScrollView(
                child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(
                    top: Get.height * .04,
                    left: Get.height * .02,
                    right: Get.height * .02),
                padding: EdgeInsets.only(
                    bottom: Get.height * .04,
                    top: Get.height * .02,
                    left: Get.height * .02,
                    right: Get.height * .02),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xCAD0D1D7)),
                child: Column(children: [
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Votre Ticket',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        FontAwesomeIcons.busAlt,
                        size: 30,
                      ),
                      Text(
                        'Travelling',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
                  InfoReservationComp(title: "Depart", value: "Yaounde"),
                  InfoReservationComp(title: "Arrive", value: "Douala"),
                  InfoReservationComp(title: "Lieux", value: "Mvan"),
                  InfoReservationComp(title: "Type de voyage", value: "VIP"),
                  InfoReservationComp(title: "Heure de depart", value: "18H20"),

                  InfoReservationComp(title: "Numero de Bus", value: "11"),

                  InfoReservationComp(title: "Numero de siege", value: "15"),

                  InfoReservationComp(title: "Montant", value: "3500 FCFA"),
                  InfoReservationComp(
                      title: "Date Reservation", value: "19 Juin 2022"),

                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Code QR reservation :',
                      ),
                    ],
                  )),
                  Container(
                      child: QrImage(
                    data:
                        "12345jkjljlkjl6789012345jkjljlkjl6789012345jkjljlkjl6789012345jkjljlkjl67890",
                    version: QrVersions.auto,
                    size: 200.0,
                  )),
                  // SingleChildScrollView(
                  //     child: SizedBox(
                  //   height: Get.height * .64532,
                  //   child: ListView.builder(
                  //     itemCount: 20,
                  //     itemBuilder: (ctx, index) => HistoryComponent(),
                  //   ),
                  // ))
                ]))
          ],
        )));
  }
}
