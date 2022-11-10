import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellingVendeur/components/Button/btnCatList.dart';
import 'package:travellingVendeur/components/Widget/HistoryComponent.dart';

class ListReservationScreen extends StatefulWidget {
  const ListReservationScreen({Key? key}) : super(key: key);

  @override
  State<ListReservationScreen> createState() => _ListReservationScreenState();
}

class _ListReservationScreenState extends State<ListReservationScreen> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      margin:
          EdgeInsets.only(left: Get.height * .012, right: Get.height * .012),
      child: SingleChildScrollView(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // (!focused) ? CAppBarComponent() : SizedBox(height: 0, width: 0),
          Container(

              // alignment: Alignment.center,
              margin: EdgeInsets.only(
                  left: Get.width * .010,
                  right: Get.width * .010,
                  bottom: Get.height * .02,
                  top: (focused) ? Get.height * .02 : Get.height * .05),
              child: Row(children: [
                Flexible(
                    child: SizedBox(
                        height: Get.height * .06,
                        child: new TextFormField(
                          // controller: widget.controller,
                          validator: (value) {
                            return value == ""
                                ? "veillez remplir se champs"
                                : null;
                          },
                          onTap: () {
                            setState(() {
                              focused = true;
                            });
                          },
                          // enabled: widget.enabled,
                          onChanged: (val) {
                            setState(() {
                              focused = true;
                            });
                          },
                          keyboardType: TextInputType.text,
                          // obscureText: widget.type == 1 ? true : false,
                          decoration: new InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            counterText: "",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              // borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.only(
                              left: 15,
                              bottom: 11,
                              top: 15,
                              right: 15,
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ))),
                (focused)
                    ? TextButton(
                        child: Text('Annuler'),
                        onPressed: () {
                          setState(() {
                            focused = false;
                          });
                        },
                      )
                    : SizedBox(height: 0, width: 0),
              ])),
          SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.only(bottom: Get.height * .009),
                  padding: EdgeInsets.only(
                      bottom: Get.height * .04,
                      top: Get.height * .01,
                      left: Get.width * .01,
                      right: Get.width * .01),
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(8),
                  //         topRight: Radius.circular(8)),
                  //     color: Color(0xCA5B79F2)),
                  child: SingleChildScrollView(
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(
                            margin: EdgeInsets.only(bottom: Get.height * .009),
                            child: Text(
                              'Liste des reservations Effectuee',
                              style: TextStyle(
                                  fontSize: 16 /* , color: Colors.white */),
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                            height: Get.height * .1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                BtnCatList(
                                  title: 'Journaliere',
                                  onTap: () => print('ffddfd'),
                                  active: true,
                                ),
                                BtnCatList(
                                  title: 'Par Voyage',
                                  onTap: () => print('ffddfd'),
                                  active: false,
                                ),
                                BtnCatList(
                                  title: 'Mensuelle',
                                  onTap: () => print('ffddfd'),
                                  active: false,
                                ),
                                BtnCatList(
                                  title: 'Mensuelle',
                                  onTap: () => print('ffddfd'),
                                  active: false,
                                )
                              ],
                            )),
                        SingleChildScrollView(
                            child: SizedBox(
                          height: Get.height,
                          child: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (ctx, index) =>
                                  Text('') //HistoryComponent(),
                              ),
                        ))
                      ]))))
        ],
      )),
    );
  }
}
