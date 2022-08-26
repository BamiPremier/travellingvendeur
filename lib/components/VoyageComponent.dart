import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellingVendeur/styles/colorApp.dart';

class VoyageComponent extends StatelessWidget {
  VoyageComponent({this.index});
  var index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Get.width * .020),
      decoration: BoxDecoration(
          gradient: GradientApp.blueR,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage('assets/login.png'))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Container(
          //     height: Get.height * .2,
          //     width: Get.width * .8,
          //     margin: EdgeInsets.only(bottom: Get.height * .010),
          //     child: Image.asset('assets/login.png'),
          //     decoration: BoxDecoration(

          //         // borderRadius: BorderRadius.only(
          //         //     topLeft: Radius.circular(10),
          //         //     topRight: Radius.circular(10)),
          //         border: Border(
          //             bottom: BorderSide(
          //                 color: ColorsApp.greenLight, width: 1.0)))),
          Container(
              decoration: BoxDecoration(
                  color: ColorsApp.grey,
                  borderRadius: BorderRadius.circular(13)),
              margin: EdgeInsets.only(
                bottom: Get.height * .01,
                right: Get.width * .020,
                left: Get.width * .020,
              ),
              padding: EdgeInsets.only(
                bottom: Get.height * .01,
                top: Get.height * .01,
                left: Get.width * .01,
              ),
              child: Column(children: [
                Container(
                    margin: EdgeInsets.only(left: Get.width * .017),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Agence $index',
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(left: Get.width * .017),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Lieux $index',
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(left: Get.width * .017),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Heure de depart : 8H00',
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(left: Get.width * .017),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Ville de depart $index',
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(left: Get.width * .017),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Ville d\'arrivee $index',
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ]))
        ],
      ),
    );
  }
}
