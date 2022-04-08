// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:calculation_app/Const/const.keywords.dart';
import 'package:calculation_app/Model/equ_model.dart';
import 'package:calculation_app/Widget/dlg_weight_entry.dart';
import 'package:flutter/material.dart';

import '../Widget/custom-text.dart';

class ItemEquipmentListView extends StatefulWidget {
  final Function callback;
  final EquipmentModel equipmentModel;
  final int id;
  final String name;
  final double weight;
  final double arm;
  final double moment;
  const ItemEquipmentListView(
      {Key? key,
      required this.callback,
      required this.equipmentModel,
      required this.id,
      required this.name,
      required this.weight,
      required this.arm,
      required this.moment})
      : super(key: key);

  @override
  State<ItemEquipmentListView> createState() => _ItemEquipmentListViewState();
}

class _ItemEquipmentListViewState extends State<ItemEquipmentListView> {
  double paddingValue = 8;
  late String _name = '';
  late double _weight = 0;
  late double _moment = 0;

  double get _mGetMoment {
    return _weight * widget.arm / 1000; //Calculate moment
  }

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _weight = widget.weight;
    _moment = widget.moment;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.id % 2 == 0 ? Colors.black12 : Colors.white10,
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          //vName
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(paddingValue),
                child: CustomText(
                  text: widget.name,
                ),
              )),

          //vWeight
          Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DlgWeightEntry(
                            callback: (double w) {
                              _mDoAfterCallback(w);
                            },
                            equipmentModel: widget.equipmentModel,
                            equName: widget.name,
                            id: widget.id,
                            weight: widget.weight);
                      }).then((value) {
                    return widget.callback(_weight, _moment);
                  });
                },
                child: Container(
                  alignment: _name == ConstKeywords.BaseAircraft ||
                          _name == ConstKeywords.Oil
                      ? Alignment.center
                      : Alignment.centerRight,
                  padding: EdgeInsets.all(paddingValue),
                  child: _name == ConstKeywords.BaseAircraft ||
                          _name == ConstKeywords.Oil
                      ? Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                text: _weight.toStringAsFixed(2),
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.left,
                                textColor: Colors.black54,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                text: _weight.toStringAsFixed(2),
                                fontWeight: FontWeight.bold,
                                textDecoration: TextDecoration.underline,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                ),
              )),

          //vArm
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(paddingValue),
                child: CustomText(
                  text: widget.arm.toString(),
                ),
              )),

          //vMoment
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(paddingValue),
                child: CustomText(
                  text: _moment.toStringAsFixed(2),
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }

  void _mDoAfterCallback(double w) {
    setState(() {
      w == _weight ? null : {_weight = w, _moment = _mGetMoment};
    });
  }
}
