import 'package:get/get.dart';
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommentForm extends StatelessWidget {
  String? hint;
  IconData? icon;
  TextInputType? type;
  TextEditingController? controller;
  Function(String)? onChange;
  Function? onTap;
  bool? obscureText;
  CommentForm(
      {this.hint,
      this.icon,
      this.onChange,
      this.type,
      this.controller,
      this.obscureText = false,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height * .13,
        width: Get.width * .7,
        alignment: Alignment.topCenter,
        child: TextFormField(
          onChanged: (String value) {
            if (onChange != null) onChange!(value);
          },
          controller: controller,
          validator: (value) {
            return value!.isEmpty ? "veillez remplir se champs" : null;
          },
          keyboardType: type,
          obscureText: obscureText!,
          maxLengthEnforced: false,
          maxLength: 1000,
          maxLines: 20,
          decoration: new InputDecoration(
            fillColor: ColorsApp.skyBlue,
            counter: Offstage(),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: ColorsApp.grey,
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(.4),
              ),
            ),
            contentPadding: EdgeInsets.only(
              left: 12,
              bottom: 10,
              top: 10,
              right: 12,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: 'orkney',
            ),
            // suffixIcon: InkWell(
            //   onTap: () => onTap,
            //   child: Icon(
            //     icon,
            //     color: Colors.grey,
            //   ),
            // ),
          ),
        ));
  }
}
