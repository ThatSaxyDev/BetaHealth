// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart' as pro;
import 'package:routemaster/routemaster.dart';

import 'package:betahealth/core/bloc/global_bloc.dart';
import 'package:betahealth/models/medicine.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';

class ReminderDetailsView extends ConsumerWidget {
  final Medicine medicine;
  const ReminderDetailsView({
    super.key,
    required this.medicine,
  });

  SvgPicture makeIcon(double size) {
    //here is the bug, the capital word of the first letter
    //lets fix
    if (medicine.medicineType == 'Bottle') {
      return SvgPicture.asset(
        'lib/assets/icons/bottle.svg',
        color: Pallete.primaryTeal,
        height: 50.h,
      );
    } else if (medicine.medicineType == 'Pill') {
      return SvgPicture.asset(
        'lib/assets/icons/pill.svg',
        color: Pallete.primaryTeal,
        height: 50.h,
      );
    } else if (medicine.medicineType == 'Syringe') {
      return SvgPicture.asset(
        'lib/assets/icons/syringe.svg',
        color: Pallete.primaryTeal,
        height: 50.h,
      );
    } else if (medicine.medicineType == 'Tablet') {
      return SvgPicture.asset(
        'lib/assets/icons/tablet.svg',
        color: Pallete.primaryTeal,
        height: 50.h,
      );
    }
    //in case of no medicine type icon selection
    return SvgPicture.asset(
      'info'.svg,
      height: 50.h,
    );
  }

  void deleteReminder(GlobalBloc globalBloc, BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content:
                const Text('Are you sure you want to delete this reminder?'),
            actions: [
              TextButton(
                onPressed: () {
                  Routemaster.of(context).pop();
                  globalBloc.removeMedicine(medicine);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Routemaster.of(context).pop();
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalBloc globalBloc = pro.Provider.of<GlobalBloc>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
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
                  'Reminders',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                40.sbW,
              ],
            ),
            30.sbH,

            // main section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 50.w,
                  backgroundColor: Pallete.imagePlaceHolder3.withOpacity(0.4),
                  child: makeIcon(50.w),
                ),
                SizedBox(
                  height: 100.h,
                  width: 200.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              color: Pallete.blackColor,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          6.sbH,
                          Text(
                            medicine.medicineName!,
                            style: TextStyle(
                              color: Pallete.blackColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dosage',
                            style: TextStyle(
                              color: Pallete.blackColor,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          6.sbH,
                          Text(
                            medicine.dosage == 0
                                ? 'Not Specified'
                                : "${medicine.dosage} mg",
                            style: TextStyle(
                              color: Pallete.blackColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            40.sbH,

            // extended section
            Container(
              height: 250.h,
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                  color: Pallete.imagePlaceHolder1.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Medicine Type',
                        style: TextStyle(
                          color: Pallete.blackColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      6.sbH,
                      Text(
                        medicine.medicineType! == 'None'
                            ? 'Not Specified'
                            : medicine.medicineType!,
                        style: TextStyle(
                          color: Pallete.blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dose Interval',
                        style: TextStyle(
                          color: Pallete.blackColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      6.sbH,
                      Text(
                        'Every ${medicine.interval} hours  ||  ${medicine.interval == 24 ? "Once daily" : "${(24 / medicine.interval!).floor()} times daily"}',
                        style: TextStyle(
                          color: Pallete.blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: TextStyle(
                          color: Pallete.blackColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      6.sbH,
                      Text(
                        '${medicine.startTime![0]}${medicine.startTime![1]}:${medicine.startTime![2]}${medicine.startTime![3]}',
                        style: TextStyle(
                          color: Pallete.blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            50.sbH,

            //! delete button
            GestureDetector(
              onTap: () {
                // deleteReminder(globalBloc, context);
                Routemaster.of(context).pop();
              },
              child: Container(
                height: 55.h,
                width: 55.w,
                decoration: BoxDecoration(
                    color: Pallete.whiteColor,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                          color: Pallete.tileShadow.withOpacity(0.5),
                          offset: const Offset(-1, 2),
                          blurRadius: 7),
                    ]),
                child: const Center(
                  child: Icon(
                    PhosphorIcons.xBold,
                    color: Pallete.thickRed,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
