import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travellingVendeur/components/Widget/InfoReservationComp.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({this.reservation});
  final reservation;

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
          title: Text('Informations sur reservation',
              style: TextStyle(color: Colors.black),
              overflow: TextOverflow.ellipsis),
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
                height: Get.height * .85,
                margin: EdgeInsets.only(
                    // top: Get.height * .04,
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
                      width: Get.width * .8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Votre Ticket',
                            overflow: TextOverflow.ellipsis,
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
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  InfoReservationComp(
                      title: "Nom", value: widget.reservation.nom),

                  InfoReservationComp(
                      title: "Prenom", value: widget.reservation.prenom),
                  InfoReservationComp(
                      title: "Phone", value: widget.reservation.phone),

                  InfoReservationComp(
                      title: "Date", value: widget.reservation.date),
                  InfoReservationComp(
                      title: "Type de voyage",
                      value: widget.reservation.typeBillet),
                  // InfoReservationComp(
                  //     title: "Heure de depart",
                  //     value: widget.reservation['heure']),

                  // InfoReservationComp(
                  //     title: "Numero de Bus",
                  //     value: widget.reservation['numBus'].toString()),

                  InfoReservationComp(
                      title: "Numero de siege",
                      value: widget.reservation.numeroSiege.toString()),

                  // InfoReservationComp(
                  //     title: "Montant",
                  //     value:
                  //         "${widget.reservation['montant'].toString()} FCFA"),
                  // InfoReservationComp(
                  //     title: "Date Reservation",
                  //     value: widget.reservation['date']),

                  // Container(
                  //     child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Text(
                  //       'Code QR reservation :',
                  //       overflow: TextOverflow.ellipsis,
                  //     ),
                  //   ],
                  // )),
                  // Container(
                  //     child: QrImage(
                  //   data: widget.reservation['code'],
                  //   version: QrVersions.auto,
                  //   size: 122.0,
                  // )),
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
