/* // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Const/my_colors.dart';
import 'custom-text.dart';

class EquipmentListItem extends StatefulWidget {
  final int id;
  final String name;
  final double weight;
  final double arm;
  final double moment;
  const EquipmentListItem(
      {Key? key,
      required this.id,
      required this.name,
      required this.weight,
      required this.arm,
      required this.moment})
      : super(key: key);

  @override
  State<EquipmentListItem> createState() => _EquipmentListItemState();
}

class _EquipmentListItemState extends State<EquipmentListItem> {
  double paddingValue = 8;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.id % 2 == 0 ? Colors.black12 : Colors.white10,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(paddingValue),
                child: CustomText(
                  text: widget.name,
                ),
              )),
          Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  print(widget.id);
                },
                child: Container(
                  alignment: widget.id == 8 ?  Alignment.center : Alignment.centerRight,
                  padding: EdgeInsets.all(paddingValue),
                  child:  widget.id == 8 ?  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: widget.weight.toString(),
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: 4,),
                    ],
                  ) :  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: widget.weight.toString(),
                        fontWeight: FontWeight.bold,
                        textDecoration: TextDecoration.underline,
                      ),
                      SizedBox(width: 4,),
                     Icon(Icons.edit, size: 18, color: Colors.grey,)
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
                  text: widget.arm.toString(),
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(paddingValue),
                child: CustomText(
                  text: widget.moment.toString(),
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
 */