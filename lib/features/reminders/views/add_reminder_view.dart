import 'dart:math';

import 'package:betahealth/core/bloc/global_bloc.dart';
import 'package:betahealth/core/notifications/notifications.dart';
import 'package:betahealth/features/base_nav_wrapper/views/base_nav_wrapper.dart';
import 'package:betahealth/features/reminders/bloc/new_entry_bloc.dart';
import 'package:betahealth/models/errors.dart';
import 'package:betahealth/models/medicine.dart';
import 'package:betahealth/models/medicine_type.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/convert_time.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart' as pro;
import 'package:routemaster/routemaster.dart';

class AddReminderView extends ConsumerStatefulWidget {
  const AddReminderView({Key? key}) : super(key: key);

  @override
  ConsumerState<AddReminderView> createState() => _AddReminderViewState();
}

class _AddReminderViewState extends ConsumerState<AddReminderView> {
  late TextEditingController nameController;
  late TextEditingController dosageController;
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late NewEntryBloc _newEntryBloc;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
    _newEntryBloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    // flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _newEntryBloc = NewEntryBloc();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    // initializeNotifications();
    initializeErrorListen();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = pro.Provider.of<GlobalBloc>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add New Reminder',
          style: TextStyle(color: Pallete.blackColor),
        ),
      ),
      body: pro.Provider<NewEntryBloc>.value(
        value: _newEntryBloc,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.sbH,
                const PanelTitle(
                  title: 'Medicine Name',
                  isRequired: true,
                ),
                15.sbH,

                // input medicine name
                TextFormField(
                  maxLength: 12,
                  controller: nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide:
                            const BorderSide(color: Pallete.primaryTeal)),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Pallete.primaryTeal),
                ),

                10.sbH,
                const PanelTitle(
                  title: 'Dosage (in mg)',
                  isRequired: false,
                ),
                15.sbH,

                // dosage input
                TextFormField(
                  maxLength: 4,
                  controller: dosageController,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide:
                            const BorderSide(color: Pallete.primaryTeal)),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Pallete.primaryTeal),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const PanelTitle(title: 'Medicine Type', isRequired: false),
                15.sbH,
                StreamBuilder<MedicineType>(
                  //new entry block
                  stream: _newEntryBloc.selectedMedicineType,
                  builder: (context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //not yet clickable?
                        MedicineTypeColumn(
                            medicineType: MedicineType.Bottle,
                            name: 'Bottle',
                            iconValue: 'lib/assets/icons/bottle.svg',
                            isSelected: snapshot.data == MedicineType.Bottle
                                ? true
                                : false),
                        MedicineTypeColumn(
                            medicineType: MedicineType.Pill,
                            name: 'Pill',
                            iconValue: 'lib/assets/icons/pill.svg',
                            isSelected: snapshot.data == MedicineType.Pill
                                ? true
                                : false),
                        MedicineTypeColumn(
                            medicineType: MedicineType.Syringe,
                            name: 'Syringe',
                            iconValue: 'lib/assets/icons/syringe.svg',
                            isSelected: snapshot.data == MedicineType.Syringe
                                ? true
                                : false),
                        MedicineTypeColumn(
                            medicineType: MedicineType.Tablet,
                            name: 'Tablet',
                            iconValue: 'lib/assets/icons/tablet.svg',
                            isSelected: snapshot.data == MedicineType.Tablet
                                ? true
                                : false),
                      ],
                    );
                  },
                ),
                20.sbH,
                Container(
                  padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 5.h),
                  decoration: BoxDecoration(
                      border: Border.all(color: Pallete.orange),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      PanelTitle(title: 'Interval Selection', isRequired: true),
                      // 10.sbH,
                      //! to select intervals
                      IntervalSelection(),
                    ],
                  ),
                ),
                15.sbH,

                const PanelTitle(title: 'Starting Time', isRequired: true),
                15.sbH,

                //! to select time
                const SelectTime(),
                25.sbH,

                //! confirm button
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: height(context) * 0.5),
                    child: BButton(
                      width: 200.w,
                      onTap: () {
                        //add medicine
                        //some validations
                        //go to success screen
                        String? medicineName;
                        int? dosage;

                        //medicineName
                        if (nameController.text == "") {
                          _newEntryBloc.submitError(EntryError.nameNull);
                          return;
                        }
                        if (nameController.text != "") {
                          medicineName = nameController.text;
                        }
                        //dosage
                        if (dosageController.text == "") {
                          dosage = 0;
                        }
                        if (dosageController.text != "") {
                          dosage = int.parse(dosageController.text);
                        }
                        for (var medicine in globalBloc.medicineList$!.value) {
                          if (medicineName == medicine.medicineName) {
                            _newEntryBloc.submitError(EntryError.nameDuplicate);
                            return;
                          }
                        }
                        if (_newEntryBloc.selectIntervals!.value == 0) {
                          _newEntryBloc.submitError(EntryError.interval);
                          return;
                        }
                        if (_newEntryBloc.selectedTimeOfDay$!.value == 'None') {
                          _newEntryBloc.submitError(EntryError.startTime);
                          return;
                        }

                        String medicineType = _newEntryBloc
                            .selectedMedicineType!.value
                            .toString()
                            .substring(13);

                        int interval = _newEntryBloc.selectIntervals!.value;
                        String startTime =
                            _newEntryBloc.selectedTimeOfDay$!.value;

                        List<int> intIDs =
                            makeIDs(24 / _newEntryBloc.selectIntervals!.value);
                        List<String> notificationIDs =
                            intIDs.map((i) => i.toString()).toList();

                        Medicine newEntryMedicine = Medicine(
                            notificationIDs: notificationIDs,
                            medicineName: medicineName,
                            dosage: dosage,
                            medicineType: medicineType,
                            interval: interval,
                            startTime: startTime);

                        //update medicine list via global bloc
                        globalBloc.updateMedicineList(newEntryMedicine);

                        //schedule notification
                        // scheduleNotification(newEntryMedicine);
                        addReminderNotification(
                          name: medicineName!,
                          dosage: dosage!,
                          type: medicineType,
                          interval: interval,
                        );

                        scheduleReminderNotification(newEntryMedicine);

                        // ! TODO: implement success screen
                        Routemaster.of(context).pop();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SuccessScreen()));
                      },
                      item: Text(
                        'Confirm',
                        style: TextStyle(
                          color: Pallete.whiteColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initializeErrorListen() {
    _newEntryBloc.errorState$!.listen((EntryError error) {
      switch (error) {
        case EntryError.nameNull:
          displayError("Please enter the medicine's name");
          break;

        case EntryError.nameDuplicate:
          displayError("Medicine name already exists");
          break;
        case EntryError.dosage:
          displayError("Please enter the dosage required");
          break;
        case EntryError.interval:
          displayError("Please select the reminder's interval");
          break;
        case EntryError.startTime:
          displayError("Please select the reminder's starting time");
          break;
        default:
      }
    });
  }

  void displayError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Pallete.primaryTeal,
        content: Text(error),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const BaseNavWrapper()));
  }
}

class SelectTime extends StatefulWidget {
  const SelectTime({Key? key}) : super(key: key);

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  // bool _clicked = false;

  @override
  void initState() {
    super.initState();
    _time = TimeOfDay.now();
    _selectInitialTime();
  }

  Future<TimeOfDay> _selectInitialTime() async {
    final NewEntryBloc newEntryBloc =
        pro.Provider.of<NewEntryBloc>(context, listen: false);
    final TimeOfDay picked = TimeOfDay.now();

    setState(() {
      _time = picked;
      // _clicked = true;

      //update state via provider, we will do later
      newEntryBloc.updateTime(convertTime(_time.hour.toString()) +
          convertTime(_time.minute.toString()));
    });

    return picked;
  }

  Future<TimeOfDay> _selectTime() async {
    final NewEntryBloc newEntryBloc =
        pro.Provider.of<NewEntryBloc>(context, listen: false);

    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null) {
      setState(() {
        _time = picked;
        // _clicked = true;

        //update state via provider, we will do later
        newEntryBloc.updateTime(convertTime(_time.hour.toString()) +
            convertTime(_time.minute.toString()));
      });
    }
    return picked!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Pallete.primaryTeal,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(25.r),
            ),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        onPressed: () {
          _selectTime();
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // _clicked == false
                //     ? "Select Time"
                //     :
                "${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Pallete.primaryTeal),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: Pallete.primaryTeal,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IntervalSelection extends StatefulWidget {
  const IntervalSelection({Key? key}) : super(key: key);

  @override
  State<IntervalSelection> createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  final _intervals = [6, 8, 12, 24];
  var _selected = 0;
  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = pro.Provider.of<NewEntryBloc>(context);
    return SizedBox(
      // height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Remind me every',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Pallete.blackTint,
                ),
          ),
          DropdownButton(
            iconEnabledColor: Pallete.primaryTeal,
            dropdownColor: Pallete.whiteColor,
            // itemHeight: 8.h,
            hint: _selected == 0
                ? Text(
                    'Select an Interval',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Pallete.primaryTeal,
                        ),
                  )
                : null,
            elevation: 4,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map(
              (int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Pallete.orange,
                        ),
                  ),
                );
              },
            ).toList(),
            onChanged: (newVal) {
              setState(
                () {
                  _selected = newVal!;
                  newEntryBloc.updateInterval(newVal);
                },
              );
            },
          ),
          Text(
            _selected == 1 ? " hour" : " hours",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Pallete.blackTint),
          ),
        ],
      ),
    );
  }
}

class MedicineTypeColumn extends StatelessWidget {
  const MedicineTypeColumn(
      {Key? key,
      required this.medicineType,
      required this.name,
      required this.iconValue,
      required this.isSelected})
      : super(key: key);
  final MedicineType medicineType;
  final String name;
  final String iconValue;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = pro.Provider.of<NewEntryBloc>(context);
    return GestureDetector(
      onTap: () {
        //select medicine type
        //lets create a new block for selecting and adding new entry
        newEntryBloc.updateSelectedMedicine(medicineType);
      },
      child: SizedBox(
        height: 110.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 75.w,
              height: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: isSelected ? Pallete.primaryTeal : Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: SvgPicture.asset(
                    iconValue,
                    height: 100.h,
                    color: isSelected ? Colors.white : Pallete.primaryTeal,
                  ),
                ),
              ),
            ),
            Container(
              width: 65.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: isSelected ? Pallete.primaryTeal : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: isSelected ? Colors.white : Pallete.primaryTeal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  const PanelTitle({Key? key, required this.title, required this.isRequired})
      : super(key: key);
  final String title;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: TextStyle(
                  color: Pallete.blackTint,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: isRequired ? " *" : "",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Pallete.primaryTeal,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
