import 'package:calculation_app/N698R/Const/my_colors.dart';
import 'package:calculation_app/N698R/Const/values.dart';
import 'package:calculation_app/N698R/ListViewItems/item_equ.dart';
import 'package:calculation_app/N698R/Model/equ_model.dart';
import 'package:calculation_app/N698R/Screen/show_graph.dart';
import 'package:calculation_app/N698R/Service/get_equ_list.dart';
import 'package:calculation_app/N698R/Utils/my_scr_size.dart';
import 'package:calculation_app/N698R/Widget/custom-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';


class N698RCalculationScreen extends StatefulWidget {
  const N698RCalculationScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<N698RCalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<N698RCalculationScreen> {
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
    _totalMoment = tM * 1000 / tW;
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
        systemOverlayStyle: const SystemUiOverlayStyle(
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
                            padding: const EdgeInsets.all(5),
                            child: const CustomText(
                              text: 'Equ.Name',
                              textColor: Colors.white,
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: const [
                                CustomText(
                                  text: 'Weight',
                                  textColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                CustomText(
                                  text: "(lb)",
                                  textColor: Colors.white,
                                  fontSize: 12,
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: const [
                                CustomText(
                                  text: 'Arm',
                                  textColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                CustomText(
                                  text: "(in)",
                                  textColor: Colors.white,
                                  fontSize: 12,
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: const [
                                CustomText(
                                  text: 'Moment',
                                  textColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                CustomText(
                                  text: "/1000 (inch P)",
                                  textColor: Colors.white,
                                  fontSize: 12,
                                )
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
            const Divider(
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
                          children: const [
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
                              style: const TextStyle(
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
                                style: const TextStyle(
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
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
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
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    children: const [],
                  ))
                ],
              ),
            ),
            const SizedBox(
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
                child: const CustomText(
                  text: "Show Graphical View",
                  fontSize: 16,
                )),
          ],
        ),
      ),
    );
  }
}
