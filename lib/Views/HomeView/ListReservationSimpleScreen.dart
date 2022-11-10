import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellingVendeur/components/Widget/HistoryComponent.dart';
import 'package:travellingVendeur/components/Widget/LoadingComponent.dart';
import 'package:travellingVendeur/model/data/VoyageModelX.dart';
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:travellingVendeur/utils/Services/requestServices.dart';
import 'package:travellingVendeur/utils/functions/viewFunctions.dart';

class ListReservationSimpleScreen extends StatefulWidget {
  const ListReservationSimpleScreen({Key? key}) : super(key: key);

  @override
  State<ListReservationSimpleScreen> createState() =>
      _ListReservationSimpleScreenState();
}

class _ListReservationSimpleScreenState
    extends State<ListReservationSimpleScreen> {
  bool focused = false;
  bool ok = false;
  List<Billet> _listReservation = [];
  // ignore: must_call_super
  getData() async {
    await new ApiService().getHistoriqueBilletServeuse().then((value) {
      setState(() {
        print(value);
        _listReservation = value;

        ok = true;
      });
      // Timer(Duration(seconds: 15), () {
      //   print('********************${counter}');
      //   getData();
      // });
    }).catchError((e) {
      ViewFunctions().verifiedConnection();
      // Timer(Duration(seconds: 3), () {
      //   print('********************${counter}');
      //   getData();
      // });
      // getData();
    });
  }

  @override
  void initState() {
    getData();
  }

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
                        ok
                            ? SingleChildScrollView(
                                child: SizedBox(
                                height: Get.height,
                                child: ListView.builder(
                                  itemCount: _listReservation.length,
                                  itemBuilder: (ctx, index) => HistoryComponent(
                                      reservation: _listReservation[index]),
                                ),
                              ))
                            : new LoadingComponent().data
                      ]))))
        ],
      )),
    );
  }
}
