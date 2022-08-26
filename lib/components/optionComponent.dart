import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionComponent extends StatelessWidget {
  OptionComponent({this.title, this.selected = false, this.onTap});
  var title, onTap;

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(
              top: Get.height * .08,
              left: Get.width * .01,
              right: Get.width * .01),
          decoration: BoxDecoration(
            color: this.selected ? Colors.green : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(this.title), Icon(Icons.arrow_forward_ios_sharp)],
          ),
        ));
  }
}
