import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weight/Controller.dart';
import 'package:weight/Screen2.dart';
import 'package:weight/screen.dart';
import 'package:weight/textpage.dart';

void main() async{ // birinci storage ni yaraymalisan ki telefonda file yaransin
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('MyStorage');
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final Controller _ctrl = Get.put(Controller());

  Widget build(BuildContext context) {
    _ctrl.read();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: _ctrl.g.read("list") == null ? TextPage() : Screen2(),
    );
  }
}