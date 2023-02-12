// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:betahealth/core/bloc/global_bloc.dart';
import 'package:betahealth/features/reminders/views/reminder_details_view.dart';
import 'package:betahealth/models/medicine.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:betahealth/theme/palette.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart' as pro;

class RemindersTile extends ConsumerWidget {
  final Medicine medicine;
  const RemindersTile({
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
        height: 15.h,
      );
    } else if (medicine.medicineType == 'Pill') {
      return SvgPicture.asset(
        'lib/assets/icons/pill.svg',
        color: Pallete.primaryTeal,
        height: 15.h,
      );
    } else if (medicine.medicineType == 'Syringe') {
      return SvgPicture.asset(
        'lib/assets/icons/syringe.svg',
        color: Pallete.primaryTeal,
        height: 15.h,
      );
    } else if (medicine.medicineType == 'Tablet') {
      return SvgPicture.asset(
        'lib/assets/icons/tablet.svg',
        color: Pallete.primaryTeal,
        height: 15.h,
      );
    }
    //in case of no medicine type icon selection
    return SvgPicture.asset(
      'info'.svg,
      height: 15.h,
    );
  }

  void deleteReminder(GlobalBloc globalBloc, BuildContext context) async {
    globalBloc.removeMedicine(medicine);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalBloc globalBloc = pro.Provider.of<GlobalBloc>(context);
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          deleteReminder(globalBloc, context);
        }),
        children: [
          //! DELETE
          SlidableAction(
              flex: 1,
              onPressed: (value) {
                deleteReminder(globalBloc, context);
              },
              backgroundColor: Pallete.thickRed.withOpacity(0.2),
              foregroundColor: Pallete.thickRed,
              icon: PhosphorIcons.trashSimpleFill),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder<void>(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, Widget? child) {
                    return Opacity(
                      opacity: animation.value,
                      child: ReminderDetailsView(medicine: medicine),
                    );
                  },
                );
              },
              transitionDuration: const Duration(milliseconds: 500),
            ),
          );
        },
        child: Container(
          height: 55.h,
          width: 327.w,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          margin: EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
            color: Pallete.whiteColor,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Pallete.tileShadow.withOpacity(0.5),
                offset: const Offset(-1, 2),
                blurRadius: 7,
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22.5.w,
                backgroundColor: Pallete.imagePlaceHolder3.withOpacity(0.4),
                child: makeIcon(15.h),
              ),
              8.sbW,
              Text(
                medicine.medicineName!,
                style: TextStyle(
                  color: Pallete.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                medicine.interval == 1
                    ? "Every ${medicine.interval} hours"
                    : "Every ${medicine.interval} hours",
                style: TextStyle(
                  color: Pallete.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
