import 'package:travellingVendeur/components/button.dart';
import 'package:travellingVendeur/components/customBtn.dart';
import 'package:travellingVendeur/components/formComponent.dart';
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:flutter/material.dart';

import 'package:travellingVendeur/utils/Services/routing.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController repass = TextEditingController();
  TextEditingController email = TextEditingController();

  bool error = false;
  bool is_disable = false;
  late int telephone;
  late String password;
  // AuthProvider api = AuthProvider();
  // GetStorage box = GetStorage();

  bool validator = false;
  bool validator2 = false;

  bool enabled = false;
  bool enableD = true;
  bool loading = false;
  /* 
  bool enableName = true;
  bool enableMail = true;
  bool enablePasword = true;
  bool enableNumber = true; */
  var phoneSa = '';
  var nom = '';
  var mailSa = '';

  var passSa = '';
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // api.onInit();
  }

  final int _numPages = 2;
  final pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  late TabController _tabController;
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(
          i == _tabController.index ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 14.0 : 10,
      width: isActive ? 14.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.cyan : ColorsApp.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  bool enabledData = false;
  String payCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        // backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            SingleChildScrollView(
                child: Container(
                    // alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    // padding: EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(top: 0, left: 20, right: 20),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Hero(
                              tag: "login screen",
                              child: new Container(
                                  child: Image.asset('assets/login.png')),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: Get.size.height * .008,
                                  bottom: Get.size.height * .02),
                              // alignment: Alignment.center,
                              child: Text(
                                'Create your Account',
                                // textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Text(
                            //   "Sign Up here !",
                            //   // textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // Text(
                            //   "Your Welcome.",
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     fontSize: 17,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: Get.size.height * .025,
                                    bottom: Get.size.height * .025),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                // padding: EdgeInsets.only(
                                //   top: 25,
                                // ),
                                child: Column(
                                  children: [
                                    FormComponent(
                                        icon: Icons.account_circle,
                                        type: 0,
                                        controller: name,
                                        enabled: true,
                                        hint: "name"),
                                    FormComponent(
                                        icon: Icons.account_circle,
                                        type: 0,
                                        controller: surname,
                                        enabled: true,
                                        hint: "surname"),
                                    FormComponent(
                                        icon: Icons.account_circle,
                                        type: 0,
                                        controller: phone,
                                        enabled: true,
                                        hint: "Ville"),
                                    FormComponent(
                                        icon: Icons.account_circle,
                                        type: 0,
                                        controller: phone,
                                        enabled: true,
                                        hint: "Phone"),
                                    // FormComponent(
                                    //     icon: Icons.lock,
                                    //     type: 1,
                                    //     controller: pass,
                                    //     enabled: true,
                                    //     hint: "password"),
                                    // FormComponent(
                                    //     icon: Icons.lock,
                                    //     type: 1,
                                    //     controller: repass,
                                    //     enabled: true,
                                    //     hint: "repeat-password")
                                  ],
                                )),
                            Button(
                                borderRadius: 15.0,
                                width: Get.size.height * .8,
                                margin: EdgeInsets.only(
                                    top: Get.size.height * .025, bottom: 0),
                                height: Get.size.height * .08,
                                loaderColor: Colors.white,
                                title: "Next",
                                textColor: Colors.white,
                                itemColor: Colors.blue,
                                borderColor: Colors.transparent,
                                state: validator,
                                enabled: true,
                                onTap: () async {
                                  _tabController.index++;
                                }),
                          ],
                        ),
                      ),
                    ))),
            SingleChildScrollView(
                child: Container(
                    // alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    // padding: EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: Get.size.height * .008,
                                  bottom: Get.size.height * .05),
                              alignment: Alignment.center,
                              child: Text(
                                'Finish creation of Account',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "Confirm your register!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Enter security code.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: Get.size.height * .025,
                                    bottom: Get.size.height * .025),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                // padding: EdgeInsets.only(
                                //   top: 25,
                                // ),
                                child: Column(
                                  children: [
                                    FormComponent(
                                        icon: Icons.account_circle,
                                        type: 0,
                                        controller: phone,
                                        enabled: true,
                                        hint: "Code"),
                                    FormComponent(
                                        icon: Icons.lock,
                                        type: 1,
                                        controller: pass,
                                        enabled: true,
                                        hint: "password"),
                                    FormComponent(
                                        icon: Icons.lock,
                                        type: 1,
                                        controller: repass,
                                        enabled: true,
                                        hint: "repeat-password")
                                  ],
                                )),
                            Button(
                                borderRadius: 15.0,
                                width: Get.size.height * .8,
                                margin: EdgeInsets.only(
                                    top: Get.size.height * .025, bottom: 0),
                                height: Get.size.height * .08,
                                loaderColor: Colors.white,
                                title: "Validate",
                                textColor: Colors.white,
                                itemColor: Colors.blue,
                                borderColor: Colors.transparent,
                                state: validator,
                                enabled: true,
                                onTap: () async {
                                  Get.toNamed(AppLinks.FIRST);
                                }),
                            Button(
                                borderRadius: 15.0,
                                width: Get.size.height * .8,
                                margin: EdgeInsets.only(
                                    top: Get.size.height * .025, bottom: 0),
                                height: Get.size.height * .08,
                                loaderColor: Colors.white,
                                title: "Back",
                                textColor: Colors.white,
                                itemColor: Colors.grey,
                                borderColor: Colors.transparent,
                                state: validator,
                                enabled: true,
                                onTap: () async {
                                  _tabController.index--;
                                }),
                          ],
                        ),
                      ),
                    ))),
          ],
        ));
  }
}
