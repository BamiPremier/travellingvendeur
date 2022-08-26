// ignore: must_be_immutable
import 'package:get/get.dart';
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlaceComponent extends StatelessWidget {
  var place, onTap, selectedId;

  PlaceComponent({this.place, this.onTap, this.selectedId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: Get.height * .8,
          width: Get.width * .8,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
              color:
                  (selectedId == place.toString()) ? Colors.blue : Colors.green,
              border: Border.all()),
          child: Text('Place $place')),
      onTap: onTap,
    );
  }
}
