import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weight/Controller.dart';
import 'package:weight/Screen2.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller _ctrl = Get.put(Controller());
    return Scaffold(
      floatingActionButton: Container(
        width: 150,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 30,
          onPressed: () async {
            if ((_ctrl.t1.value.text == "" ||
                    _ctrl.t2.value.text == "" ||
                    _ctrl.t3.value.text == "") ||
                (double.tryParse(_ctrl.t1.value.text) == null &&
                    int.tryParse(_ctrl.t2.value.text) == null &&
                    int.tryParse(_ctrl.t3.value.text) == null) ||
                (double.parse(_ctrl.t1.value.text).toInt() < 20 ||
                    double.parse(_ctrl.t1.value.text).toInt() > 250) ||
                (int.parse(_ctrl.t2.value.text).toInt() < 100 ||
                    int.parse(_ctrl.t2.value.text).toInt() > 250) ||
                (int.parse(_ctrl.t3.value.text).toInt() < 5 ||
                    int.parse(_ctrl.t3.value.text).toInt() > 100)) {
              Get.snackbar("OPS!", "Form düzgün əlavə et",
                  overlayBlur: 3,
                  colorText: Colors.black,
                  icon: Icon(Icons.mood_bad_rounded));
            } else {
              await _ctrl.save();
              await _ctrl.read();
              Get.to(Screen2());
            }
          },
          child: Text(
            "Form Əlavə Et",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(33, 103, 243, 0.609),
          Color.fromRGBO(34, 0, 64, 0.9)
        ], transform: GradientRotation(2))),
        child: Container(
          width: Get.width - 30,
          height: Get.height / 2,
          padding: EdgeInsets.only(top: Get.height / 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                margin: EdgeInsets.only(right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _ctrl.t1.value,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(119, 0, 255, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(98, 87, 255, 1))),
                    hintText: "Çəki (65.4,78.0...)",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                padding: EdgeInsets.only(left: 20),
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _ctrl.t2.value,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(98, 1, 177, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(98, 87, 255, 1))),
                      hintText: "Boy (168,175...)",
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                padding: EdgeInsets.only(left: 20),
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _ctrl.t3.value,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(98, 1, 177, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(98, 87, 255, 1))),
                      hintText: "Yaş (22,35...)",
                    ),
                  ),
                ),
              ),
              Container(
                height: 200,
                child: Image.asset("lib/assetimage/Running_icon_-_Noun_Project_17825.svg.png"))
            ],
          ),
        ),
      ),
    );
  }
}
