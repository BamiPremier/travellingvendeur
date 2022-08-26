import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travellingVendeur/components/button.dart';
import 'package:travellingVendeur/components/infoComponent.dart';
import 'package:travellingVendeur/components/themeButton.dart';
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:travellingVendeur/utils/Services/routing.dart';
import 'package:travellingVendeur/utils/api/apiUrl.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool imgBool = false;
  bool disponible = false;
  Map data = {};
  String id = '';
  @override
  void initState() {
    // ApiService.getCurrentUser().then((value) {
    //   setState(() {
    //     disponible = true;
    //     data = value;
    //   });
    // });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  child: ThemeButtonWidget(),
                  padding: EdgeInsets.only(right: 10),
                ),
              ]),
              // disponible
              //     ?

              Modify(data: data)
              // : Center(
              //     child: SpinKitCircle(
              //     color: Colors.blue,
              //     size: 40,
              //   ))
            ],
          ))
    ])));
  }
}

class ModifyFirst extends StatefulWidget {
  ModifyFirst({this.data});
  final data;
  @override
  _ModifyFirstState createState() => _ModifyFirstState();
}

class _ModifyFirstState extends State<ModifyFirst> {
  bool imgBool = false;

  GetStorage box = GetStorage();

  var listChild = [
    {"title": "Save", "action": () => print("Save"), "icon": Icons.file_upload},
    {
      "title": "Confidentialites ",
      "action": () => print("Confidentialites"),
      "icon": Icons.add
    },
    {
      "title": " Favorite",
      "action": () => print("Securite"),
      "icon": Icons.favorite_border
    },
    {
      "title": "Configurations",
      "action": () => print("Langue"),
      "icon": Icons.settings
    },
    {
      "title": " Securite",
      "action": () => print("Securite"),
      "icon": Icons.security
    },
    {
      "title": "Log Out",
      // ignore: top_level_function_literal_block
      "action": () => print("Log Out"),
      /* (BuildContext context) {
       
         route(context, Wrapper(), close: true);
   return   GetStorage().erase(); },
*/
      "icon": Icons.security
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      CircleAvatar(
        child: Icon(Icons.flight_takeoff_sharp, size: 25),
      ),
      Container(
        child: Text(
          "User Name ",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.only(left: 10),
      ),
      Container(
        child: Text(
          "690863838",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.only(left: 10),
      ),
      // SettingBlocComponent(listChild: listChild),
    ]));
  }
}

class Modify extends StatefulWidget {
  Modify({this.data});
  final data;
  @override
  _ModifyState createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  bool imgBool = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _phoneontroller = TextEditingController();

  TextEditingController _newpasswordController = TextEditingController();

  bool udateAdd = false;
  bool udatePass = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Column(children: <Widget>[
        Container(
            child: Column(
          children: [
            Stack(children: [
              Container(
                  decoration: new BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Icon(Icons.account_circle, size: 25)),
            ]),
          ],
        )),
        Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(children: <Widget>[
              InfoComponent(
                  title: Row(children: [
                    Text("First name"),
                    Container(
                        child: Icon(FontAwesomeIcons.pen,
                            size: 12, color: Color(0xFFCFD6D6)),
                        margin: EdgeInsets.only(left: 10))
                  ]),
                  value: "Nom",
                  onTap: () {
                    print("eeeeeeeeee");
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) => StatefulBuilder(
                              builder: (BuildContext context,
                                      StateSetter setState) =>
                                  Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0)), //this right here
                                child: Container(
                                  height: 180,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Votre nom',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0, left: 8),
                                      ),
                                      SizedBox(
                                          child: TextFormField(
                                        onChanged: (value) {},
                                        controller: _nomController,
                                        validator: (value) {
                                          if (value == "") {
                                            return "veillez remplir se champs";
                                          } else {
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: "nom",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                child: const Text(
                                                  'CANCEl',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                onPressed: () {
                                                  _nomController.clear();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              Button(
                                                  title: 'Update',
                                                  enabled: true,
                                                  state: false,
                                                  onTap: () async {
                                                    /*   if (_addressController
                                                        .text.isNotEmpty) {
                                                      setState(() {
                                                        udateAdd = true;
                                                      });

                                                      try {
                                                        var payload =
                                                            Jwt.parseJwt(widget
                                                                .accessToken);
                                                        String userid =
                                                            payload["id"]
                                                                .toString();
                                                        var body = {
                                                          "nom":
                                                              _nomController
                                                                  .text
                                                        };
                                                        print(
                                                            '${ApiUrl.baseUrl}/api/membres/$userid        ${body}');
                                                        var dio =
                                                            await CustomDio()
                                                                .getApiClient();
                                                        final response =
                                                            await dio.patch(
                                                                '${ApiUrl.baseUrl}/api/membres/$userid',
                                                                data:
                                                                    json.encode(
                                                                        body),
                                                                options: Options(
                                                                    headers: {
                                                                      "Content-Type":
                                                                          "application/merge-patch+json"
                                                                    }));
                                                        if (response.statusCode ==
                                                                200 ||
                                                            response.statusCode ==
                                                                201) {
                                                          print(response.data);
                                                          _addressController
                                                              .clear();

                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            udateAdd = false;
                                                          });
                                                        }
                                                      } catch (e) {}
                                                    } else {
                                                      return 0;
                                                    } */
                                                  },
                                                  height: 40,
                                                  width: 100,
                                                  textColor: Colors.white,
                                                  borderColor:
                                                      ColorsApp.skyBlue,
                                                  loaderColor: Colors.white),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  }),
              InfoComponent(
                  title: Row(children: [
                    Text("Last name"),
                    Container(
                        child: Icon(FontAwesomeIcons.pen,
                            size: 12, color: Color(0xFFCFD6D6)),
                        margin: EdgeInsets.only(left: 10))
                  ]),
                  value: "Prenom",
                  onTap: () {
                    print("eeeeeeeeee");
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) => StatefulBuilder(
                              builder: (BuildContext context,
                                      StateSetter setState) =>
                                  Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0)), //this right here
                                child: Container(
                                  height: 180,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Votre prenom',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0, left: 8),
                                      ),
                                      SizedBox(
                                          child: TextFormField(
                                        onChanged: (value) {},
                                        controller: _prenomController,
                                        validator: (value) {
                                          if (value == "") {
                                            return "veillez remplir se champs";
                                          } else {
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: "prenom",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                child: const Text(
                                                  'CANCEl',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                onPressed: () {
                                                  _prenomController.clear();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              Button(
                                                  title: 'Update',
                                                  enabled: true,
                                                  state: false,
                                                  onTap: () async {
                                                    /*   if (_addressController
                                                        .text.isNotEmpty) {
                                                      setState(() {
                                                        udateAdd = true;
                                                      });

                                                      try {
                                                        var payload =
                                                            Jwt.parseJwt(widget
                                                                .accessToken);
                                                        String userid =
                                                            payload["id"]
                                                                .toString();
                                                        var body = {
                                                          "adress":
                                                              _addressController
                                                                  .text
                                                        };
                                                        print(
                                                            '${ApiUrl.baseUrl}/api/membres/$userid        ${body}');
                                                        var dio =
                                                            await CustomDio()
                                                                .getApiClient();
                                                        final response =
                                                            await dio.patch(
                                                                '${ApiUrl.baseUrl}/api/membres/$userid',
                                                                data:
                                                                    json.encode(
                                                                        body),
                                                                options: Options(
                                                                    headers: {
                                                                      "Content-Type":
                                                                          "application/merge-patch+json"
                                                                    }));
                                                        if (response.statusCode ==
                                                                200 ||
                                                            response.statusCode ==
                                                                201) {
                                                          print(response.data);
                                                          _addressController
                                                              .clear();

                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            udateAdd = false;
                                                          });
                                                        }
                                                      } catch (e) {}
                                                    } else {
                                                      return 0;
                                                    } */
                                                  },
                                                  height: 40,
                                                  width: 100,
                                                  textColor: Colors.white,
                                                  borderColor:
                                                      ColorsApp.skyBlue,
                                                  loaderColor: Colors.white),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  }),
              InfoComponent(
                  title: Row(children: [
                    Text("Phone number"),
                    Container(
                        child: Icon(FontAwesomeIcons.pen,
                            size: 12, color: Color(0xFFCFD6D6)),
                        margin: EdgeInsets.only(left: 10))
                  ]),
                  value: "Aucun",
                  onTap: () {
                    print("eeeeeeeeee");
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) => StatefulBuilder(
                              builder: (BuildContext context,
                                      StateSetter setState) =>
                                  Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0)), //this right here
                                child: Container(
                                  height: 180,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Votre numero',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0, left: 8),
                                      ),
                                      SizedBox(
                                          child: TextFormField(
                                        onChanged: (value) {},
                                        controller: _phoneontroller,
                                        validator: (value) {
                                          if (value == "") {
                                            return "veillez remplir se champs";
                                          } else {
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: "numero",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                child: const Text(
                                                  'CANCEl',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                onPressed: () {
                                                  _phoneontroller.clear();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              Button(
                                                  title: 'Update',
                                                  enabled: true,
                                                  state: false,
                                                  onTap: () async {
                                                    /*   if (_addressController
                                                        .text.isNotEmpty) {
                                                      setState(() {
                                                        udateAdd = true;
                                                      });

                                                      try {
                                                        var payload =
                                                            Jwt.parseJwt(widget
                                                                .accessToken);
                                                        String userid =
                                                            payload["id"]
                                                                .toString();
                                                        var body = {
                                                          "adress":
                                                              _addressController
                                                                  .text
                                                        };
                                                        print(
                                                            '${ApiUrl.baseUrl}/api/membres/$userid        ${body}');
                                                        var dio =
                                                            await CustomDio()
                                                                .getApiClient();
                                                        final response =
                                                            await dio.patch(
                                                                '${ApiUrl.baseUrl}/api/membres/$userid',
                                                                data:
                                                                    json.encode(
                                                                        body),
                                                                options: Options(
                                                                    headers: {
                                                                      "Content-Type":
                                                                          "application/merge-patch+json"
                                                                    }));
                                                        if (response.statusCode ==
                                                                200 ||
                                                            response.statusCode ==
                                                                201) {
                                                          print(response.data);
                                                          _addressController
                                                              .clear();

                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            udateAdd = false;
                                                          });
                                                        }
                                                      } catch (e) {}
                                                    } else {
                                                      return 0;
                                                    } */
                                                  },
                                                  height: 40,
                                                  width: 100,
                                                  textColor: Colors.white,
                                                  borderColor:
                                                      ColorsApp.skyBlue,
                                                  loaderColor: Colors.white),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  }),
              InfoComponent(
                  title: Row(children: [
                    Text("Email"),
                    Container(
                        child: Icon(FontAwesomeIcons.pen,
                            size: 12, color: Color(0xFFCFD6D6)),
                        margin: EdgeInsets.only(left: 10))
                  ]),
                  value: "email",
                  onTap: () {
                    print("eeeeeeeeee");
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) => StatefulBuilder(
                              builder: (BuildContext context,
                                      StateSetter setState) =>
                                  Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0)), //this right here
                                child: Container(
                                  height: 180,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Votre Email',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0, left: 8),
                                      ),
                                      SizedBox(
                                          child: TextFormField(
                                        onChanged: (value) {},
                                        controller: _emailController,
                                        validator: (value) {
                                          if (value == "") {
                                            return "veillez remplir se champs";
                                          } else {
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                child: const Text(
                                                  'CANCEl',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                onPressed: () {
                                                  _emailController.clear();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              Button(
                                                  title: 'Update',
                                                  enabled: true,
                                                  state: false,
                                                  onTap: () async {
                                                    /*   if (_emailController
                                                        .text.isNotEmpty) {
                                                      setState(() {
                                                        udateAdd = true;
                                                      });

                                                      try {
                                                        var payload =
                                                            Jwt.parseJwt(widget
                                                                .accessToken);
                                                        String userid =
                                                            payload["id"]
                                                                .toString();
                                                        var body = {
                                                          "adress":
                                                              _addressController
                                                                  .text
                                                        };
                                                        print(
                                                            '${ApiUrl.baseUrl}/api/membres/$userid        ${body}');
                                                        var dio =
                                                            await CustomDio()
                                                                .getApiClient();
                                                        final response =
                                                            await dio.patch(
                                                                '${ApiUrl.baseUrl}/api/membres/$userid',
                                                                data:
                                                                    json.encode(
                                                                        body),
                                                                options: Options(
                                                                    headers: {
                                                                      "Content-Type":
                                                                          "application/merge-patch+json"
                                                                    }));
                                                        if (response.statusCode ==
                                                                200 ||
                                                            response.statusCode ==
                                                                201) {
                                                          print(response.data);
                                                          _addressController
                                                              .clear();

                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            udateAdd = false;
                                                          });
                                                        }
                                                      } catch (e) {}
                                                    } else {
                                                      return 0;
                                                    } */
                                                  },
                                                  height: 40,
                                                  width: 100,
                                                  textColor: Colors.white,
                                                  borderColor:
                                                      ColorsApp.skyBlue,
                                                  loaderColor: Colors.white),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  }),
              InfoComponent(
                  title: Row(children: [
                    Text("CNI"),
                    Container(
                        child: Icon(FontAwesomeIcons.pen,
                            size: 12, color: Color(0xFFCFD6D6)),
                        margin: EdgeInsets.only(left: 10))
                  ]),
                  value: "CNI",
                  onTap: () {
                    print("eeeeeeeeee");
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) => StatefulBuilder(
                              builder: (BuildContext context,
                                      StateSetter setState) =>
                                  Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0)), //this right here
                                child: Container(
                                  height: 180,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Votre numero de cni',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0, left: 8),
                                      ),
                                      SizedBox(
                                          child: TextFormField(
                                        onChanged: (value) {},
                                        controller: _nomController,
                                        validator: (value) {
                                          if (value == "") {
                                            return "veillez remplir se champs";
                                          } else {
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: "cni",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                child: const Text(
                                                  'CANCEl',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                onPressed: () {
                                                  _nomController.clear();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              Button(
                                                  title: 'Update',
                                                  enabled: true,
                                                  state: false,
                                                  onTap: () async {
                                                    /*   if (_addressController
                                                        .text.isNotEmpty) {
                                                      setState(() {
                                                        udateAdd = true;
                                                      });

                                                      try {
                                                        var payload =
                                                            Jwt.parseJwt(widget
                                                                .accessToken);
                                                        String userid =
                                                            payload["id"]
                                                                .toString();
                                                        var body = {
                                                          "nom":
                                                              _nomController
                                                                  .text
                                                        };
                                                        print(
                                                            '${ApiUrl.baseUrl}/api/membres/$userid        ${body}');
                                                        var dio =
                                                            await CustomDio()
                                                                .getApiClient();
                                                        final response =
                                                            await dio.patch(
                                                                '${ApiUrl.baseUrl}/api/membres/$userid',
                                                                data:
                                                                    json.encode(
                                                                        body),
                                                                options: Options(
                                                                    headers: {
                                                                      "Content-Type":
                                                                          "application/merge-patch+json"
                                                                    }));
                                                        if (response.statusCode ==
                                                                200 ||
                                                            response.statusCode ==
                                                                201) {
                                                          print(response.data);
                                                          _addressController
                                                              .clear();

                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            udateAdd = false;
                                                          });
                                                        }
                                                      } catch (e) {}
                                                    } else {
                                                      return 0;
                                                    } */
                                                  },
                                                  height: 40,
                                                  width: 100,
                                                  textColor: Colors.white,
                                                  borderColor:
                                                      ColorsApp.skyBlue,
                                                  loaderColor: Colors.white),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  }),
              InfoComponent(
                  title: Row(children: [
                    Text("Password"),
                    Container(
                        child: Icon(FontAwesomeIcons.pen,
                            size: 12, color: Color(0xFFCFD6D6)),
                        margin: EdgeInsets.only(left: 10))
                  ]),
                  value: "*****",
                  onTap: () {
                    print("eeeeeeeeee");
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) => StatefulBuilder(
                            builder: (BuildContext context,
                                    StateSetter setState) =>
                                Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)), //this right here
                                    child: Container(
                                      height: 300,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0, top: 8),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Ancien mot de passe',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                margin: EdgeInsets.only(
                                                    top: 10.0,
                                                    bottom: 10.0,
                                                    left: 8),
                                              ),
                                              SizedBox(
                                                  child: TextFormField(
                                                onChanged: (value) {},
                                                controller: _passwordController,
                                                validator: (value) {
                                                  if (value == "") {
                                                    return "veillez remplir se champs";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: "*****",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              )),
                                              Container(
                                                child: Text(
                                                  'Nouveau mot de passe',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                margin: EdgeInsets.only(
                                                    top: 10.0,
                                                    bottom: 10.0,
                                                    left: 8),
                                              ),
                                              SizedBox(
                                                  child: TextFormField(
                                                onChanged: (value) {},
                                                controller:
                                                    _newpasswordController,
                                                validator: (value) {
                                                  if (value == "") {
                                                    return "veillez remplir se champs";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: "*****",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              )),
                                              Container(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      TextButton(
                                                        child: const Text(
                                                          'CANCEl',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                        onPressed: () {
                                                          _newpasswordController
                                                              .clear();

                                                          _passwordController
                                                              .clear();

                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      Button(
                                                          title: 'Update',
                                                          enabled: true,
                                                          state: false,
                                                          onTap: () async {},
                                                          height: 40,
                                                          width: 100,
                                                          textColor:
                                                              Colors.white,
                                                          borderColor:
                                                              ColorsApp.skyBlue,
                                                          loaderColor:
                                                              Colors.white),
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))));
                  }),
              Button(
                  borderRadius: 15.0,
                  width: Get.size.height,
                  margin:
                      EdgeInsets.only(top: Get.size.height * .025, bottom: 0),
                  height: Get.size.height * .08,
                  loaderColor: Colors.white,
                  title: "Deconnecter",
                  textColor: Colors.white,
                  itemColor: Colors.red,
                  borderColor: Colors.transparent,
                  // state: validator,
                  enabled: true,
                  onTap: () async {
                    Get.toNamed(AppLinks.LOGIN);
                  }),
            ])),
      ])
    ]));
  }
}
