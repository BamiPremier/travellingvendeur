import 'package:travellingVendeur/utils/Services/routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      box.write('isDark', true);
    } else {
      box.write('isDark', false);
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppLinks.SPLASHSCREEN,
      getPages: AppRoutes.pages,
    );
  }
}
