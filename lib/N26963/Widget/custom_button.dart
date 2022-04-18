import 'package:calculation_app/N26963/Screen/calculationScreen.dart';
import 'package:calculation_app/N698R/Const/const.keywords.dart';
import 'package:calculation_app/N698R/Const/my_colors.dart';
import 'package:calculation_app/N698R/Screen/calculationScreen.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String id;
  const CustomButton({Key? key, required this.id}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary:
              widget.id == ConstKeywords.plane_1 ? MyColor.col_4 : MyColor.col_3,
          fixedSize: Size((MediaQuery.of(context).size.width * 60) / 100, 0),
          
        ),
        onPressed: () {
          widget.id == ConstKeywords.plane_1
              ? Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return N26963CalculationScreen(
                      title: "${widget.id} Cheetah Weight and Balance");
                }))
              : Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return N698RCalculationScreen(
                      title: '${widget.id} Cheetah Weight and Balance');
                }));
        },
        child: Text(
          widget.id,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
