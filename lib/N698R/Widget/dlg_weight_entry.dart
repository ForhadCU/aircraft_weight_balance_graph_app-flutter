// ignore_for_file: prefer_const_constructors

import 'package:calculation_app/N698R/Const/const.keywords.dart';
import 'package:calculation_app/N698R/Model/equ_model.dart';
import 'package:calculation_app/main.dart';
import 'package:flutter/material.dart';

import '../Const/my_colors.dart';
import '../Utils/my_scr_size.dart';
import 'custom-text.dart';

class DlgWeightEntry extends StatefulWidget {
  final Function callback;
  final EquipmentModel equipmentModel;
  final int id;
  final String equName;
  final double weight;

  const DlgWeightEntry(
      {Key? key,
      required this.callback,
      required this.equipmentModel,
      required this.equName,
      required this.id,
      required this.weight})
      : super(key: key);

  @override
  State<DlgWeightEntry> createState() => _DlgWeightEntryState();
}

class _DlgWeightEntryState extends State<DlgWeightEntry> {
  final TextEditingController _controllerWeightEdtTxt = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerWeightEdtTxt.text = widget.equName == ConstKeywords.Fuel
        ? (widget.weight / 6).toStringAsFixed(2)
        : widget.weight.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
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
                text: widget.equName,
                textColor: MyColor.col_3,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20,
              ),

              TextField(
                onTap: (() => _controllerWeightEdtTxt.selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: _controllerWeightEdtTxt.value.text.length)),
                controller: _controllerWeightEdtTxt,
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
                  widget.callback(_controllerWeightEdtTxt.text.isEmpty
                      ? widget.weight
                      : widget.equName == ConstKeywords.Fuel
                          ? double.parse(_controllerWeightEdtTxt.text) * 6
                          : double.parse(_controllerWeightEdtTxt.text));
                  Navigator.of(context).pop();
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
