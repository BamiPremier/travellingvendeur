import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:travellingVendeur/styles/colorApp.dart';

class LoadingComponent {
  Widget data = Container(
      margin: EdgeInsets.only(top: Get.height * .5),
      alignment: Alignment.center,
      child: SpinKitCircle(
        color: ColorsApp.bleuLight,
      ));
}
