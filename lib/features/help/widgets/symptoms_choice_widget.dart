// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';

class SymptomsChoiceWidget extends StatelessWidget {
  final String title;
  final String icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  const SymptomsChoiceWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 13.w),
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: SizedBox(
          height: 100.h,
          width: 55.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 27.5.w,
                backgroundColor: Pallete.lightbrownColor,
                child: CircleAvatar(
                  radius: 26.7.w,
                  backgroundColor: backgroundColor ?? Pallete.whiteColor,
                  child: SvgPicture.asset(
                    icon.svg,
                    height: 26.h,
                    color: iconColor ?? Pallete.lightbrownColor,
                  ),
                ),
              ),
              6.sbH,
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Pallete.blackColor,
                  fontSize: 10.sp,
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
