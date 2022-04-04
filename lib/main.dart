// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:calculation_app/Const/my_colors.dart';
import 'package:calculation_app/Model/equ_model.dart';
import 'package:calculation_app/Screen/show_graph.dart';
import 'package:calculation_app/Service/get_equ_list.dart';
import 'package:calculation_app/Utils/my_scr_size.dart';
import 'package:calculation_app/Widget/custom-text.dart';
import 'package:calculation_app/Widget/item_equ.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'N26963Cheetah Weight and Balance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculationScreen(title: 'N26963Cheetah Weight and Balance'),
    );
  }
}

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  List<EquipmentModel> equListModel = EquipmentListService.getEquipmentList();
  double paddingValue = 2.0;
  double totalWeight = 0.00;
  double totalMoment = 0.00;
  double leftWeight = 2189.20;

  TextEditingController edtTxtWeightCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            //status bar color
            statusBarColor: Colors.white,
            //status bar brightness
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomText(
            text: widget.title,
            textColor: MyColor.col_4,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            //Header Line
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: MyColor.col_4,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: CustomText(
                              text: 'Equ.Name',
                              textColor: Colors.white,
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            child: CustomText(
                              text: 'Weight',
                              textColor: Colors.white,
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(5),
                            child: CustomText(
                              text: 'Arm',
                              textColor: Colors.white,
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(5),
                            child: CustomText(
                              text: 'Moment',
                              textColor: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),

            //List all equipments
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: equListModel.length,
                itemBuilder: (context, index) {
                  EquipmentModel equipmentModel = equListModel[index];

                  return EquipmentListItem(
                    equipmentModel: equipmentModel,
                    id: equipmentModel.id,
                    name: equipmentModel.equName,
                    weight: equipmentModel.weight,
                    arm: equipmentModel.arm,
                    moment: equipmentModel.moment,
                  );
                }),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.black54,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Total (W) : ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              totalWeight == 0
                                  ? "10.80"
                                  : totalWeight.toStringAsFixed(2),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                totalMoment == 0
                                    ? "Total (M)   :   0.35"
                                    : "Total (M)   :   " +
                                        totalMoment.toStringAsFixed(2),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Left (W) : ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              leftWeight < 0
                                  ? "0.00"
                                  : leftWeight.toStringAsFixed(2),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    children: [],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () {
                  EquipmentModel equipmentModel = equListModel[7];
                  print(equipmentModel.moment);
                  Navigator.push(context,PageTransition(child: ShowGraphScreen(eqList: equListModel), type: PageTransitionType.bottomToTop));

                },
                style: ElevatedButton.styleFrom(
                    primary: MyColor.col_1,
                    fixedSize: Size(
                        MyScreenSize.mGetWidth(
                            context: context, percentage: 80),
                        0),
                    side: BorderSide(color: MyColor.col_2)),
                child: CustomText(
                  text: "Show Graphical View",
                  fontSize: 16,
                )),
          ],
        ),
      ),
    );
  }

  Widget EquipmentListItem(
      {required EquipmentModel equipmentModel,
      required int id,
      required String name,
      required double weight,
      required double arm,
      required double moment}) {
    return Container(
        padding: EdgeInsets.only(right: 8, left: 6),
        height: MyScreenSize.mGetHeight(context: context, percentage: 8.0),
        color: equipmentModel.id % 2 == 0 ? Colors.white10 : Colors.black12,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(paddingValue),
                  child: CustomText(
                    text: name,
                  ),
                )),
            Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    equipmentModel.id == 8
                        ? null
                        : showDialog(
                            context: context,
                            builder: (context) {
                              return _showInputDiaglog(
                                  equipmentModel,
                                  equipmentModel.equName,
                                  equipmentModel.weight);
                            }).then((value) {});
                    // print(equipmentModel.id);
                  },
                  child: Container(
                    alignment: equipmentModel.id == 8
                        ? Alignment.center
                        : Alignment.centerRight,
                    padding: /* equipmentModel.id == 8
                                    ? EdgeInsets.only(
                                        top: paddingValue,
                                        bottom: paddingValue,
                                        left: 6,
                                        right: paddingValue)
                                    : */
                        EdgeInsets.all(paddingValue),
                    child: equipmentModel.id == 8
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: equipmentModel.weight.toStringAsFixed(2),
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: equipmentModel.weight.toStringAsFixed(2),
                                fontWeight: FontWeight.bold,
                                textDecoration: TextDecoration.underline,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.edit,
                                size: 18,
                                color: Colors.grey,
                              )
                            ],
                          ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(paddingValue),
                  child: CustomText(
                    text: equipmentModel.arm.toString(),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(paddingValue),
                  child: CustomText(
                    text: equipmentModel.id == 8
                        ? "0.35"
                        : moment.toStringAsFixed(2),
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ));
  }

  Widget _showInputDiaglog(
      EquipmentModel equipmentModel, String equName, double weight) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //Checking Part
            Column(children: [
              CustomText(
                text: equName,
                textColor: MyColor.col_3,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20,
              ),

              TextField(
                controller: edtTxtWeightCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    label: Text("Weight"),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColor.col_3))),
              ), //team name textfield

              SizedBox(
                height: 20,
              ),
              //Create Button Part
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    equipmentModel.weight = edtTxtWeightCtrl.text.isEmpty
                        ? weight
                        : double.parse(edtTxtWeightCtrl.text);
                    if (equName == "Fuel (gallons)") {
                      equipmentModel.weight *= 6;
                    }
                    equipmentModel.moment =
                        equipmentModel.weight * equipmentModel.arm / 1000;
                    totalWeight = 0.00;
                    totalMoment = 0.00;
                    // leftWeight = 2200.00;
                    for (var i = 0; i < equListModel.length; i++) {
                      EquipmentModel equipmentModel = equListModel[i];
                      totalWeight += equipmentModel.weight;
                      totalMoment += equipmentModel.moment;
                    }
                    leftWeight = 2200 - totalWeight;
                    edtTxtWeightCtrl = TextEditingController();
                    Navigator.of(context).pop();
                  });
                },
                child: CustomText(
                  text: "Enter",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                style: ElevatedButton.styleFrom(
                    primary: MyColor.col_3,
                    fixedSize: Size(
                        MyScreenSize.mGetWidth(
                            context: context, percentage: 60),
                        0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ), //create btn

              //team id textfield
            ]),
          ],
        ),
      ),
    );
  }
}
