// ignore: must_be_immutable
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnCatList extends StatelessWidget {
  var title, onTap, active;

  BtnCatList({this.active = false, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: Get.size.width * 0.17,
          height: Get.size.height * 0.08,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (active) ? ColorsApp.blue : ColorsApp.grey,
          ),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'orkney',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
