// ignore_for_file: prefer_const_constructors

import 'package:calculation_app/N698R/Model/equ_model.dart';
import 'package:calculation_app/N698R/Utils/my_scr_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Const/my_colors.dart';
import '../Widget/custom-text.dart';

class ShowGraphScreen extends StatefulWidget {
  // final List<EquipmentModel> eqList;
  final double totalWeight;
  final double totalMoment;
  const ShowGraphScreen(
      {Key? key,
      // required this.eqList,
      required this.totalWeight,
      required this.totalMoment})
      : super(key: key);

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
              //status bar color
              statusBarColor: Colors.white,
              //status bar brightness
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light),
          elevation: 0,
          backgroundColor: Colors.white,
          //title: CustomText(
          //   text: "N698R CG Graph",
          // textColor: MyColor.col_4,
          //fontSize: 18,
          //fontWeight: FontWeight.bold),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(right: 5),
                height:
                    MyScreenSize.mGetHeight(context: context, percentage: 60),
                child: SfCartesianChart(
                    title: ChartTitle(
                        textStyle: TextStyle(fontSize: 14),
                        text: 'N698R CG Envelope',
                        alignment: ChartAlignment.center),
                    annotations: <CartesianChartAnnotation>[
                      CartesianChartAnnotation(
                          widget: Container(
                              color: Colors.blue,
                              height: 5,
                              width: 5,
                              child: Text(
                                ".",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              )),
                          coordinateUnit: CoordinateUnit.point,
                          // region: AnnotationRegion.plotArea,
                          x: widget.totalMoment,
                          y: widget.totalWeight),
                    ],
                    palette: <Color>[Color.fromRGBO(244, 67, 54, 1), Colors.green],
                    primaryXAxis: NumericAxis(
                      // interval: 2,
                      // opposedPosition: true,
                      interval: 0.2,
                      minimum: 161,
                      maximum: 174,
                      title: AxisTitle(
                        textStyle: TextStyle(fontSize: 14),
                        text: 'Moment/1000',
                      ),
                    ),
                    primaryYAxis: NumericAxis(
                      // edgeLabelPlacement: EdgeLabelPlacement.shift,
                      // interval: 300,
                      interval: 250,
                      minimum: 5000,
                      maximum: 7250,
                      title: AxisTitle(
                        text: 'Weight',
                        textStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                    // adding multiple axis
                    /*  axes: <ChartAxis>[
                      NumericAxis(
                          name: 'xAxis',
                          opposedPosition: true,
                          interval: 1,
                          minimum: 0,
                          maximum: 5,
                          title: AxisTitle(text: 'Secondary X Axis')),
                      NumericAxis(
                          name: 'yAxis',
                          opposedPosition: true,
                          title: AxisTitle(text: 'Secondary Y Axis'))
                    ], */
                    series: <ChartSeries>[
                      LineSeries<ChartData, double>(
                          dataSource: [
                            ChartData(161.8, 5000),
                            ChartData(161.8, 5600),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                      LineSeries<ChartData, double>(
                          dataSource: [
                            ChartData(161.8, 5600),
                            ChartData(166, 6750),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                      LineSeries<ChartData, double>(
                          dataSource: [
                            ChartData(166, 6750),
                            ChartData(166, 7000),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                      LineSeries<ChartData, double>(
                          dataSource: [
                            ChartData(166, 7000),
                            ChartData(173, 7000),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                      LineSeries<ChartData, double>(
                          dataSource: [
                            ChartData(173, 7000),
                            ChartData(173, 6100),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                      LineSeries<ChartData, double>(
                          dataSource: [
                            ChartData(173, 6100),
                            ChartData(172.7, 5000),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                      /*  LineSeries<ChartData, String>(
              dataSource: [
                ChartData('Jan', 15, "1"),
                ChartData('Feb', 11, "2"),
                ChartData('Mar', 14, "3"),
                ChartData('Apr', 12, "4"),
              ],
              xValueMapper: (ChartData data, _) => data.y1,
              yValueMapper: (ChartData data, _) => data.y,
              xAxisName: 'xAxis',
              yAxisName: 'yAxis') */
                    ])),
          ],
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final int? y;
}
