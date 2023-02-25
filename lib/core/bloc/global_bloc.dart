import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:betahealth/models/medicine.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalBloc {
  BehaviorSubject<List<Medicine>>? _medicineList$;
  BehaviorSubject<List<Medicine>>? get medicineList$ => _medicineList$;

  GlobalBloc() {
    _medicineList$ = BehaviorSubject<List<Medicine>>.seeded([]);
    makeMedicineList();
  }

  //! TO REMOVE MEDICINE FROM THE GLOBAL LIST
  Future removeMedicine(Medicine tobeRemoved) async {
    //! Retrieve an instance of SharedPreferences.
    SharedPreferences sharedUser = await SharedPreferences.getInstance();

    //! Create an empty List of String named medicineJsonList.
    List<String> medicineJsonList = [];

    //! Remove the medicine to be removed from the list of medicines.
    var blockList = _medicineList$!.value;
    blockList.removeWhere(
        (medicine) => medicine.medicineName == tobeRemoved.medicineName);

    //remove notifications
    for (int i = 0; i < (24 / tobeRemoved.interval!).floor(); i++) {
      AwesomeNotifications().cancel(int.parse(tobeRemoved.notificationIDs![i]));
    }

    //! Convert the remaining medicines to JSON strings and add them to medicineJsonList.
    if (blockList.isNotEmpty) {
      for (var blockMedicine in blockList) {
        String medicineJson = jsonEncode(blockMedicine.toJson());
        medicineJsonList.add(medicineJson);
      }
    }

    //! Store the medicineJsonList in the SharedPreferences.
    sharedUser.setStringList('medicines', medicineJsonList);
    //! Add the updated list of medicines to _medicineList$.
    _medicineList$!.add(blockList);
  }

  //! remove all reminder
  Future removeAllMedicine() async {
    //! Retrieve an instance of SharedPreferences.
    SharedPreferences sharedUser = await SharedPreferences.getInstance();

    //! Create an empty List of String named medicineJsonList.
    List<String> medicineJsonList = [];

    //remove all notifications
    AwesomeNotifications().cancelAll();

    //! Stores the empty medicineJsonList in the SharedPreferences.
    sharedUser.setStringList('medicines', medicineJsonList);

    //! Adds an empty List to _medicineList$.
    _medicineList$!.add([]);
  }

  Future updateMedicineList(Medicine newMedicine) async {
    var blocList = _medicineList$!.value;
    blocList.add(newMedicine);
    _medicineList$!.add(blocList);

    Map<String, dynamic> tempMap = newMedicine.toJson();
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    String newMedicineJson = jsonEncode(tempMap);
    List<String> medicineJsonList = [];
    if (sharedUser.getStringList('medicines') == null) {
      medicineJsonList.add(newMedicineJson);
    } else {
      medicineJsonList = sharedUser.getStringList('medicines')!;
      medicineJsonList.add(newMedicineJson);
    }
    sharedUser.setStringList('medicines', medicineJsonList);
  }

  Future makeMedicineList() async {
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    List<String>? jsonList = sharedUser.getStringList('medicines');
    List<Medicine> prefList = [];

    if (jsonList == null) {
      return;
    } else {
      for (String jsonMedicine in jsonList) {
        dynamic userMap = jsonDecode(jsonMedicine);
        Medicine tempMedicine = Medicine.fromJson(userMap);
        prefList.add(tempMedicine);
      }
      //state update
      _medicineList$!.add(prefList);
    }
  }

  void dispose() {
    _medicineList$!.close();
  }
}
