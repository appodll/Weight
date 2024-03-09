import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weight/Controller.dart';
import 'package:weight/container.dart';
import 'package:weight/screen.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    final Controller _ctrl = Get.put(Controller());
    _ctrl.read();
    _ctrl.kontrol();
    return Scaffold(
        floatingActionButton: Container(
          width: 150,
          child: FloatingActionButton(
            
            onPressed: () {
              Get.to(Screen());
            },
            backgroundColor: Colors.transparent,
            elevation: 30,
            child: Text(
              "Form Doldur",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16),
            ),
          ),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assetimage/v882batch2-kul-13-e.jpg"),
                  fit: BoxFit.cover)),
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      
                    ),
                      width: Get.width / 1.5,
                      child: PieChart(

                        PieChartData(
                        pieTouchData: PieTouchData(
                          enabled: true,
                          touchCallback: (p0, p1) {
                            
                            setState(() {
                            if (p1?.touchedSection?.touchedSectionIndex == 0){
                              _ctrl.borderr = 60.0.obs;
                            }else if (p1?.touchedSection?.touchedSectionIndex != 0){
                              _ctrl.borderr = 40.0.obs;
                            }if(p1?.touchedSection?.touchedSectionIndex == 1){
                              _ctrl.border2 = 65.0.obs;
                            }else if(p1?.touchedSection?.touchedSectionIndex != 1){
                              _ctrl.border2 = 60.0 .obs;
                            }if(p1?.touchedSection?.touchedSectionIndex == 2){
                              _ctrl.border3 = 60.0.obs;
                            }else if(p1?.touchedSection?.touchedSectionIndex != 2){
                              _ctrl.border3 = 50.0 .obs;
                            }
                            });
                          },
                        ),
                          borderData: FlBorderData(
                            show: true,
                          ),
                          sectionsSpace: 2,
                         
                          sections: [
                            PieChartSectionData(
                                value: double.parse(_ctrl.list?.last['Yas']),
                                radius: _ctrl.borderr.toDouble(),
                                gradient: LinearGradient(
                                    colors: [Colors.purple, Colors.pink]),
                                titleStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            PieChartSectionData(
                                value: double.parse(_ctrl.list?.last['Kilo']),
                                radius: _ctrl.border2.toDouble(),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 88, 30, 233),
                                    Colors.purple
                                  ],
                                ),
                                titleStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            PieChartSectionData(
                                value: double.parse(_ctrl.list?.last['Boy']),
                                radius: _ctrl.border3.toDouble(),
                                gradient: LinearGradient(colors: [
                                  const Color.fromARGB(255, 88, 30, 233),
                                  Colors.pink
                                ]),
                                titleStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ]))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_ctrl.statistic.toString(), style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    
                  ),),
                  _ctrl.icon.value
                  ],
                ),
                LinearPercentIndicator(
                  animation: true,
                  lineHeight: 20,
                  percent: _ctrl.value.toDouble(),
                  backgroundColor: Colors.deepPurple[300],
                  barRadius: Radius.circular(20),
                  linearGradient: LinearGradient(colors: [
                    Colors.deepPurple,
                    Color.fromRGBO(3, 0, 164, 0.5),
                    Color.fromRGBO(154, 0, 54, 1)
                  ]),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: _ctrl.list?.length,
                      itemBuilder: (context, index) {
                        var item = _ctrl.list?[index];
                        return Container(
                          margin: EdgeInsets.only(top: 0),
                          padding: EdgeInsets.only(bottom: 40),
                          child: ContainerList(
                            kilo: item['Kilo'],
                            boy: item['Boy'],
                            yas: item['Yas'],
                            vaxt: item['Vaxt'],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
