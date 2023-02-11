// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:routemaster/routemaster.dart';

import 'package:betahealth/features/help/widgets/emergency_line_bottom_sheet.dart';
import 'package:betahealth/features/help/widgets/symptoms_choice_widget.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/app_multi_value_listenable_builder.dart';
import 'package:betahealth/utils/picker.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';

class NewSymptomsView extends ConsumerStatefulWidget {
  const NewSymptomsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewSymptomsViewState();
}

class _NewSymptomsViewState extends ConsumerState<NewSymptomsView> {
  final TextEditingController feelingsController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  // ValueNotifier<int> selectedOne = ValueNotifier(0);
  ValueNotifier<List<int>> theIndex =
      ValueNotifier([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
  ValueNotifier<List<int>> selectedIndex = ValueNotifier([]);
  ValueNotifier<bool> res = ValueNotifier(false);

  // @override
  // void initState() {
  //   super.initState();
  //   selectedIndex.notifyListeners();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              71.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BButton(
                    width: 40.w,
                    height: 33.3.h,
                    radius: 5.r,
                    color: Pallete.backButtonGrey,
                    item: Icon(
                      Icons.arrow_back,
                      color: Pallete.blackColor,
                      size: 16.h,
                    ),
                    onTap: () {
                      Routemaster.of(context).pop();
                    },
                  ),
                  Text(
                    'New symptoms',
                    style: TextStyle(
                      color: Pallete.blackColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          'info'.svg,
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.67.sbH,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'How do you feel?',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              21.sbH,

              // text field
              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Pallete.greyColor, width: 0.5),
                ),
                child: Center(
                  child: TextField(
                    controller: feelingsController,
                    style: const TextStyle(color: Pallete.blackTint),
                    cursorColor: Pallete.blackColor,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),

              27.sbH,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'When was the last time you had a\ncheckup?',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              21.sbH,

              // date
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => showPicker(
                  context,
                  CupertinoDatePicker(
                    initialDateTime: _selectedDate,
                    mode: CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    // This is called when the user changes the time.
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() => _selectedDate = newTime);
                    },
                  ),
                ),
                child: Container(
                  height: 50.h,
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Pallete.greyColor, width: 0.5),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat.yMMMMd().format(_selectedDate),
                          style: TextStyle(
                            color: Pallete.textGrey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Pallete.primaryTeal,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              27.sbH,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Are you experiencing any of these?',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              16.sbH,

              // symptoms
              AppMultiListenableProvider(
                firstValue: selectedIndex,
                secondValue: theIndex,
                child: const SizedBox.shrink(),
                builder: (context, selectedIndexx, theIndex, child) => SizedBox(
                  height: 100.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return SymptomsChoiceWidget(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    if (selectedIndexx.contains(0)) {
                                      selectedIndexx.remove(0);
                                    } else {
                                      selectedIndexx.add(0);
                                    }
                                    break;

                                  case 1:
                                    if (selectedIndexx.contains(1)) {
                                      selectedIndexx.remove(1);
                                    } else {
                                      selectedIndexx.add(1);
                                    }
                                    break;

                                  case 2:
                                    if (selectedIndexx.contains(2)) {
                                      selectedIndexx.remove(2);
                                    } else {
                                      selectedIndexx.add(2);
                                    }
                                    break;

                                  case 3:
                                    if (selectedIndexx.contains(3)) {
                                      selectedIndexx.remove(3);
                                    } else {
                                      selectedIndexx.add(3);
                                    }
                                    break;
                                }
                                // // log('$index');

                                // if (selectedIndex.contains(index)) {
                                //   selectedIndex.remove(index);
                                // } else {
                                //   selectedIndex.add(index);
                                // }

                                // res.value = selectedIndex.every((element) =>
                                //         theIndex.contains(element)) &&
                                //     selectedIndex.isNotEmpty;

                                log(selectedIndexx.toString());
                                // // log(theIndex.toString());
                                // log(res.value.toString());
                                setState(() {});
                              },
                              title: symptomsWidgetProperties[index].title,
                              icon: symptomsWidgetProperties[index].icon,
                              iconColor: selectedIndexx.contains(index)
                                  ? Pallete.whiteColor
                                  : null,
                              backgroundColor: selectedIndexx.contains(index)
                                  ? Pallete.lightbrownColor
                                  : null,
                            );
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () => showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => Wrap(
                            children: [
                              Container(
                                height: 368.h,
                                width: double.infinity,
                                // padding: EdgeInsets.symmetric(horizontal: 24.w),
                                decoration: BoxDecoration(
                                  color: Pallete.whiteColor,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30.r),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    24.sbH,
                                    // bar
                                    Container(
                                      height: 5.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        color: Pallete.greey,
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                      ),
                                    ),
                                    36.sbH,
                                    ValueListenableBuilder(
                                      valueListenable: selectedIndex,
                                      builder: (context, value, child) => Wrap(
                                        children: symptomsWidgetProperties
                                            .map(
                                              (e) => SymptomsChoiceWidget(
                                                onTap: () {
                                                  switch (e.id) {
                                                    case 0:
                                                      if (selectedIndexx
                                                          .contains(0)) {
                                                        selectedIndexx
                                                            .remove(0);
                                                      } else {
                                                        selectedIndexx.add(0);
                                                      }
                                                      break;

                                                    case 1:
                                                      if (selectedIndexx
                                                          .contains(1)) {
                                                        selectedIndexx
                                                            .remove(1);
                                                      } else {
                                                        selectedIndexx.add(1);
                                                      }
                                                      break;

                                                    case 2:
                                                      if (selectedIndexx
                                                          .contains(2)) {
                                                        selectedIndexx
                                                            .remove(2);
                                                      } else {
                                                        selectedIndexx.add(2);
                                                      }
                                                      break;

                                                    case 3:
                                                      if (selectedIndexx
                                                          .contains(3)) {
                                                        selectedIndexx
                                                            .remove(3);
                                                      } else {
                                                        selectedIndexx.add(3);
                                                      }
                                                      break;

                                                    case 4:
                                                      if (selectedIndexx
                                                          .contains(4)) {
                                                        selectedIndexx
                                                            .remove(4);
                                                      } else {
                                                        selectedIndexx.add(4);
                                                      }
                                                      break;

                                                    case 5:
                                                      if (selectedIndexx
                                                          .contains(5)) {
                                                        selectedIndexx
                                                            .remove(5);
                                                      } else {
                                                        selectedIndexx.add(5);
                                                      }
                                                      break;

                                                    case 6:
                                                      if (selectedIndexx
                                                          .contains(6)) {
                                                        selectedIndexx
                                                            .remove(6);
                                                      } else {
                                                        selectedIndexx.add(6);
                                                      }
                                                      break;

                                                    case 7:
                                                      if (selectedIndexx
                                                          .contains(7)) {
                                                        selectedIndexx
                                                            .remove(7);
                                                      } else {
                                                        selectedIndexx.add(7);
                                                      }
                                                      break;

                                                    case 8:
                                                      if (selectedIndexx
                                                          .contains(8)) {
                                                        selectedIndexx
                                                            .remove(8);
                                                      } else {
                                                        selectedIndexx.add(8);
                                                      }
                                                      break;

                                                    case 9:
                                                      if (selectedIndexx
                                                          .contains(9)) {
                                                        selectedIndexx
                                                            .remove(9);
                                                      } else {
                                                        selectedIndexx.add(9);
                                                      }
                                                      break;
                                                  }

                                                  setState(() {});
                                                },
                                                title: e.title,
                                                icon: e.icon,
                                                iconColor: selectedIndexx
                                                        .contains(e.id)
                                                    ? Pallete.whiteColor
                                                    : null,
                                                backgroundColor: selectedIndexx
                                                        .contains(e.id)
                                                    ? Pallete.lightbrownColor
                                                    : null,
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                    20.sbH,
                                    BButton(
                                      height: 45.h,
                                      width: 160.w,
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      item: Text(
                                        'Done',
                                        style: TextStyle(
                                          color: Pallete.whiteColor,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 27.5.w,
                          backgroundColor: Pallete.lightbrownColor,
                          child: Text(
                            '+',
                            style: TextStyle(
                              color: Pallete.whiteColor,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.sbH,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What else do you want us to know?',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              21.sbH,

              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Pallete.greyColor, width: 0.5),
                ),
                child: Center(
                  child: TextField(
                    controller: feelingsController,
                    style: const TextStyle(color: Pallete.blackTint),
                    cursorColor: Pallete.blackColor,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),

              53.sbH,
              BButton(
                onTap: () {},
                item: Text(
                  'Done',
                  style: TextStyle(
                    color: Pallete.whiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SymptomWidgetProperty {
  final int id;
  final String title;
  final String icon;
  const SymptomWidgetProperty({
    required this.id,
    required this.title,
    required this.icon,
  });
}

const symptomsWidgetProperties = [
  SymptomWidgetProperty(id: 0, title: 'Headache', icon: 'headache'),
  SymptomWidgetProperty(id: 1, title: 'Sick', icon: 'sick'),
  SymptomWidgetProperty(id: 2, title: 'Tired', icon: 'tired'),
  SymptomWidgetProperty(id: 3, title: 'Diarrhoea', icon: 'tissue'),
  SymptomWidgetProperty(id: 4, title: 'Eye ache', icon: 'eye'),
  SymptomWidgetProperty(id: 5, title: 'Stomach ache', icon: 'stomach'),
  SymptomWidgetProperty(id: 6, title: 'Insomnia', icon: 'insomnia'),
  SymptomWidgetProperty(id: 7, title: 'Bloating', icon: 'balloon'),
  SymptomWidgetProperty(id: 8, title: 'Fever', icon: 'fever'),
  SymptomWidgetProperty(id: 9, title: 'Tooth ache', icon: 'toothache'),
];
