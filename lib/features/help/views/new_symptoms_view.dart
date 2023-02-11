import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/picker.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:routemaster/routemaster.dart';

class NewSymptomsView extends ConsumerStatefulWidget {
  const NewSymptomsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewSymptomsViewState();
}

class _NewSymptomsViewState extends ConsumerState<NewSymptomsView> {
  final TextEditingController feelingsController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

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
            ],
          ),
        ),
      ),
    );
  }
}
