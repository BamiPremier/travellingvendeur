import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travellingVendeur/Views/ConfigView/ReservationScreen.dart';

class HistoryComponent extends StatelessWidget {
  final reservation;

  HistoryComponent({this.reservation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            // width: Get.width,
            margin: EdgeInsets.only(bottom: Get.height * .009),
            padding: EdgeInsets.only(
                bottom: Get.height * .02,
                top: Get.height * .02,
                left: Get.height * .02,
                right: Get.height * .02),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xCA78DF80)),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Icon(FontAwesomeIcons.busAlt, size: 25),
                ),
                Container(
                    margin: EdgeInsets.only(left: Get.width * .07),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mouafo Takoumbo'),
                        Text('18 Avril 2022'),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(left: Get.width * .1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Agence'),
                        Text('Ville'),
                      ],
                    )),
              ],
            )),
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ReservationScreen())));
  }
}
