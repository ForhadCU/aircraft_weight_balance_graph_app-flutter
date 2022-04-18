// ignore_for_file: prefer_const_constructors


import 'package:calculation_app/N26963/Utils/my_scr_size.dart';
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
           //   text: "N26963 CG Graph",
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
                        text: 'N26963 CG Envelope',
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
                    palette: <Color>[Colors.red, Colors.green],
                    primaryXAxis: NumericAxis(
                      // interval: 2,
                      // opposedPosition: true,
                      interval: 5,
                      minimum: 120,
                      maximum: 210,
                      title: AxisTitle(
                        textStyle: TextStyle(fontSize: 14),
                        text: 'Moment/1000',
                      ),
                    ),
                    primaryYAxis: NumericAxis(
                      // edgeLabelPlacement: EdgeLabelPlacement.shift,
                      // interval: 300,
                      interval: 100,
                      minimum: 1500,
                      maximum: 2300,
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
                            ChartData(122, 1500),
                            ChartData(144, 1780),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
		     LineSeries<ChartData, double>(
                          dataSource: [
                            ChartData(144, 1780),
                            ChartData(188, 2200),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
		    LineSeries<ChartData, double>(
                          dataSource: [
                            ChartData(151, 1850),
                            ChartData(158, 1850),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
		    LineSeries<ChartData, double>(
                          dataSource: [
                            ChartData(128, 1500),
                            ChartData(158, 1850),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),

                      LineSeries<ChartData, double>(
                          dataSource: [
                            ChartData(139, 1500),
                            ChartData(205, 2200),
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
