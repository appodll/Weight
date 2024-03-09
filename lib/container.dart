import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerList extends StatelessWidget {
  final kilo;
  final boy;
  final yas;
  final vaxt;
  ContainerList(
      {super.key, required this.kilo, required this.boy, required this.yas, required this.vaxt});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          // width: 320,
          width: Get.width - 70,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(112, 0, 0, 0),
                  blurRadius: 15,
                ),
                BoxShadow(color: Colors.black)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.178),
                      blurRadius: 20
                    )
                  ],
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(255, 255, 255, 0.923),
                    Color.fromRGBO(41, 0, 176, 0.171)
                  ],
                  transform: GradientRotation(3)),
                  borderRadius: BorderRadius.circular(15),
                  
                ),
                height: 100,
                width: 170,
                      margin: EdgeInsets.only(right: 30),
                      child: Center(
                        child: Text(
                          "${this.vaxt}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(right: Get.width/15),
                      margin: EdgeInsets.only(top: 18),
                      child: Text(
                        "Kilo     ${this.kilo}kg",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Boy       ${this.boy}cm",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 33),
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Yaş         ${this.yas}",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
