import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CAppBarComponent extends StatelessWidget {
  const CAppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Get.height * .07),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                "Hi, Mouafo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                  top: Get.size.height * .025,
                  bottom: Get.size.height * .025,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xD5041F83)),
                // padding: EdgeInsets.only(
                //   top: 25,
                // ),
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.notifications),
                  onPressed: () => print('odddd'),
                ))
          ],
        ));
  }
}
