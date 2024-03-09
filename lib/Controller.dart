import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  Rx<TextEditingController> t1 = TextEditingController().obs;
  Rx<TextEditingController> t2 = TextEditingController().obs;
  Rx<TextEditingController> t3 = TextEditingController().obs;
  GetStorage g = GetStorage('MyStorage');

  RxList? list = [].obs;
  RxBool loading = RxBool(true);
  RxDouble borderr = 40.0.obs;
  RxDouble border2 = 60.0.obs;
  RxDouble border3 = 50.0.obs;

  RxDouble value = 0.1.obs;
  var statistic = "".obs;
  var icon = Icon(Icons.mood).obs;
  Future<void> save() async {
    loading.value = true;
    list?.value.add(
        {"Kilo": t1.value.text, "Boy": t2.value.text, "Yas": t3.value.text, "Vaxt" : DateFormat('EEE MMM d').format(DateTime.now())});
    final prefs = g.write("list", list);
    loading.value = false;
  }

  Future<void> read() async {
    final a = await g.read("list");
    loading.value = false;
  }

  listt() {
    final a = g.read("list");
    if (a != null) {
      list?.value = a;
    }
  }

  kontrol(){
    var kilo = int.parse(list?.last['Kilo']);
    var boy = pow(int.parse(list?.last['Boy']), 2)/10000;
    if ((kilo/boy)<18.5){
      value = 0.3.obs;
      icon = Icon(Icons.mood_bad_outlined, color: Colors.black).obs;
      statistic = "Kilonuz Aşağıdır".obs;
    }else if ((kilo/boy)<24.99 && (kilo/boy)>18.5){
      value = 0.5.obs;
      icon = Icon(Icons.mood_rounded, color: Colors.black).obs;
      statistic = "Kilonuz Normaldır".obs;
    }else if((kilo/boy)<29.99 && (kilo/boy)>25){
      value = 0.7.obs;
      icon = Icon(Icons.mood_bad_outlined, color: Colors.black).obs;
      statistic = "Kilonuz Yüksəkdir".obs;
    }else if((kilo/boy)>30){
      value = 0.9.obs;
      icon = Icon(Icons.mood_bad_outlined, color: Colors.black,).obs;
      statistic = "Kilonuz Çox Yüksəkdir".obs;
    }
  }
  


  Controller() {
    listt();
  }
}
