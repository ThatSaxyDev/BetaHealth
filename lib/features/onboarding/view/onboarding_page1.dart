import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage1 extends StatelessWidget {
  final void Function()? onTap;
  const OnboardingPage1({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.whiteColor,
      child: Column(
        children: [
          184.sbH,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Monitor your ',
              style: TextStyle(
                color: Pallete.blackColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: 'Health\neasily',
                  style: TextStyle(
                    color: Pallete.brownColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: ', with us',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          8.sbH,
          SizedBox(
            width: 250.w,
            height: 250.h,
            child: Image.asset('heart-rate'.gif),
          ),
          8.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.w),
            child: Text(
              'With us, you will never forget those medications and appointments',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5.h,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Pallete.blackColor,
              ),
            ),
          ),
          126.sbH,
          InkWell(
            onTap: onTap,
            child: CircleAvatar(
              radius: 35.w,
              backgroundColor: Pallete.primaryTeal,
              child: SvgPicture.asset(
                'double-chevron'.svg,
                height: 16.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
