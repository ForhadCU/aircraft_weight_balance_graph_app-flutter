// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calculation_app/Const/my_colors.dart';
import 'package:calculation_app/Const/values.dart';
import 'package:calculation_app/Model/equ_model.dart';
import 'package:calculation_app/Screen/show_graph.dart';
import 'package:calculation_app/Service/get_equ_list.dart';
import 'package:calculation_app/Utils/my_scr_size.dart';
import 'package:calculation_app/Widget/custom-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import 'ListViewItems/item_equ.dart';

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
  // List<EquipmentModel> equListModel = EquipmentListService.getEquipmentList();
  late List<EquipmentModel> _list;
  late int listSize;
  double paddingValue = 2.0;
  double _totalWeight = 0;
  double _totalMoment = 0;
  double _leftWeight = 0;

  TextEditingController edtTxtWeightCtrl = TextEditingController();

  get _mGetTotalWeight {
    double tW = 0;
    double tM = 0;
    double lW = 0;
    for (var item in _list) {
      tW += item.weight;
      tM += item.moment;
      lW = MyValues.maxWeight - tW;
    }
    _totalWeight = tW;
    _totalMoment = tM;
    _leftWeight = lW;
  }

  @override
  void initState() {
    super.initState();
    _list = [];
    ServiceGetEquipmentList.getEquipmentList().then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _mGetTotalWeight;
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
            //Heading
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
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'Weight',
                                  textColor: Colors.white,
                                ),
                                 SizedBox(height: 2,)
                                ,
                                CustomText(text: "(lb)", textColor: Colors.white, fontSize: 12,)
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'Arm',
                                  textColor: Colors.white,
                                ),
                                 SizedBox(height: 2,)
                                ,
                                CustomText(text: "(in)", textColor: Colors.white, fontSize: 12,)
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'Moment',
                                  textColor: Colors.white,
                                ),
                                 SizedBox(height: 2,)
                                ,
                                CustomText(text: "/1000 (inch P)", textColor: Colors.white, fontSize: 12,)
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),

            //ListPart
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  EquipmentModel equipmentModel = _list[index];

                  return ItemEquipmentListView(
                    callback: (double w, double m) {
                      // print(i);
                      setState(() {
                        _list[index].weight = w;
                        _list[index].moment = m;
                      });
                    },
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

            //vTotal Calculation Part
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //vTotal Weight
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Total (W) : ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              _totalWeight.toStringAsFixed(2),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),

                  //vTotal Moment
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                "Total (M) : " +
                                    _totalMoment.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),

            //vLeft Wieght
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
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              _leftWeight < 0
                                  ? "0.00"
                                  : _leftWeight.toStringAsFixed(2),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
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
                  // EquipmentModel equipmentModel = equListModel[7];
                  Navigator.push(
                      context,
                      PageTransition(
                          child: ShowGraphScreen(
                            // eqList: equListModel,
                            totalWeight: _totalWeight,
                            totalMoment: _totalMoment,
                          ),
                          type: PageTransitionType.bottomToTop));
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
}
