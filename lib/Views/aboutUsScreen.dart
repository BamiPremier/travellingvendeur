import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellingVendeur/components/customBtn.dart';
import 'package:travellingVendeur/utils/Services/routing.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AboutUs"),
        centerTitle: true,
      ),
      body: Container(
          child: CustomBtn(
        color: Colors.blue,
        title: 'Back To Home',
        onTap: () {
          Get.back();
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppLinks.HOME),
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
