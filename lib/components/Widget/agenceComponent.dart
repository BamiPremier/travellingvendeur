// ignore: must_be_immutable
import 'package:get/get.dart';
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AgenceComponent extends StatelessWidget {
  var agence;

  AgenceComponent({this.agence});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height * .6,
        width: Get.width * .5,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  child: Image.asset('assets/om.png',
                      height: MediaQuery.of(context).size.height * .23,
                      width: Get.width * .5,
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: Get.height * .008, left: Get.width * .008),
                child: Text('Finex Voyage',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: Get.height * .001, left: Get.width * .008),
                child: Text('Ville :',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              )
            ]));
  }
}
