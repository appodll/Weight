import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:weight/screen.dart';

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), (){
      Get.to(Screen());
    });
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mood_bad_outlined,
                size: 100,
                color: Colors.black,
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(124, 0, 0, 0),
                    blurRadius: 200,
                  ),
                ],
              ),
              Text(
                "OPSS! Görünürkü Form doldurmamısan.",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      
    );
  }
}
