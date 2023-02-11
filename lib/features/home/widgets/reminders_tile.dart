// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:betahealth/theme/palette.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RemindersTile extends ConsumerWidget {
  final String icon;
  const RemindersTile({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 55.h,
      width: 327.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      margin: EdgeInsets.only(bottom: 16.h),
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
            child: SvgPicture.asset(icon.svg),
          ),
          8.sbW,
          Text(
            'Use malaria drugs',
            style: TextStyle(
              color: Pallete.blackColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            '9:41',
            style: TextStyle(
              color: Pallete.blackColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
