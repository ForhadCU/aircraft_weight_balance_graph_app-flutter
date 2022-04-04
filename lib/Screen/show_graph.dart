// ignore_for_file: prefer_const_constructors

import 'package:calculation_app/Model/equ_model.dart';
import 'package:calculation_app/Utils/my_scr_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Const/my_colors.dart';
import '../Widget/custom-text.dart';

class ShowGraphScreen extends StatefulWidget {
  final List<EquipmentModel> eqList;
  const ShowGraphScreen({Key? key, required this.eqList}) : super(key: key);

  @override
  State<ShowGraphScreen> createState() => _ShowGraphScreenState();
}

class _ShowGraphScreenState extends State<ShowGraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomText(
            text: "Graphical View",
            textColor: MyColor.col_4,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MyScreenSize.mGetHeight(context: context, percentage: 70),
            // color: MyColor.col_2,
            alignment: Alignment.center,
            padding: EdgeInsets.all(2.0),
            child: SfCartesianChart(
              trackballBehavior: TrackballBehavior(enable: true),
              primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Moment/1000')),
              primaryYAxis: CategoryAxis(title: AxisTitle(text: 'Weight')),
              title: ChartTitle(text: "N2570R CG Envelope"),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<EquipmentModel, String>>[
                LineSeries(
                    dataSource: widget.eqList,
                    xValueMapper: (EquipmentModel equModel, _) =>
                        equModel.moment.toStringAsFixed(2),
                    yValueMapper: (EquipmentModel equModel, _) =>
                        equModel.weight,
                    xAxisName: 'Moment',
                    yAxisName: 'Weight',
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
