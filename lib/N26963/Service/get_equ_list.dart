

import 'package:calculation_app/N26963/Const/values.dart';
import 'package:calculation_app/N26963/Model/equ_model.dart';

class ServiceGetEquipmentList {
  static Future< List<EquipmentModel>> getEquipmentList() async {
    final List<EquipmentModel> list = _mGetDummyList();
    return list;
  }

 static List<EquipmentModel> _mGetDummyList() {
    List<EquipmentModel> dummylist = [];
    EquipmentModel equipmentModel;

    for (var i = 0; i < MyValues.names.length; i++) {
      equipmentModel = EquipmentModel(
          id: i,
          equName: MyValues.names[i],
          weight: MyValues.weight[i],
          arm: MyValues.arm[i],
          moment: MyValues.moment[i]);

      dummylist.add(equipmentModel);
    }
    return dummylist;
  }
}
/* "Pilot"
"Front Passenger"
Rear passenger 1
Rear passenger 2
Baggage
Std Equip
Fuel (gallons)
Max Fuel
Base aircraft
Oil */