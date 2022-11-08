import 'package:flutter/material.dart';
import 'package:travellingVendeur/styles/textStyle.dart';

// ignore: must_be_immutable
class FormComponent2 extends StatefulWidget {
  FormComponent2(
      {this.type,
      this.controller,
      this.enabled,
      this.icon,
      this.hint = '',
      this.marginBool = false});

  final controller;
  bool? enabled = false;
  bool marginBool;

  ///type = 0 => texte simple ; type = 1 =>password
  int? type = 0;
  String hint = '';
  var icon;
  @override
  _FormComponent2State createState() => _FormComponent2State();
}

class _FormComponent2State extends State<FormComponent2> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.marginBool
            ? EdgeInsets.only(left: kMarginLeft / 5)
            : EdgeInsets.all(0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(widget.hint),
            ),
            TextFormField(
              controller: widget.controller,
              validator: (value) {
                return value == "" ? "veillez remplir se champs" : null;
              },
              enabled: widget.enabled,
              onChanged: (val) {
                setState(() {
                  value = val;
                });

                print('value');
                print(value);
              },
              keyboardType: TextInputType.text,
              obscureText: widget.type == 1 ? true : false,
              decoration: new InputDecoration(
                prefixIcon: Icon(widget.icon),
                counterText: "",
                // focusedBorder: OutlineInputBorder(
                //     // borderRadius: BorderRadius.circular(15),
                //     borderSide: BorderSide(
                //   color: (value.isNotEmpty)
                //       ? (/* !(RegExp(r'^(0|[1-9]\d*)$')
                //                                       .hasMatch(value.text) && */
                //               value.length != 9)
                //           ? Colors.red
                //           : Colors.blue
                //       : Colors.blue,
                // )),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  // borderSide: BorderSide.,
                ),
                contentPadding: EdgeInsets.only(
                  left: 15,
                  bottom: 11,
                  top: 15,
                  right: 15,
                ),

                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ));
  }
}
