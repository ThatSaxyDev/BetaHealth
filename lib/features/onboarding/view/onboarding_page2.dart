import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage2 extends StatelessWidget {
  final void Function()? onTap;
  const OnboardingPage2({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.primaryPurple,
      child: Column(
        children: [
          184.sbH,
          Text(
            'Have access to Health\nEducation',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.5.h,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: Pallete.whiteColor,
            ),
          ),
          8.sbH,
          SizedBox(
            width: 250.w,
            height: 250.h,
            child: Image.asset('onb-hand'.gif),
          ),
          8.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.w),
            child: Text(
              'Get educated on everything that has to do with your health',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5.h,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Pallete.whiteColor,
              ),
            ),
          ),
          126.sbH,
          InkWell(
            onTap: onTap,
            child: CircleAvatar(
              radius: 35.w,
              backgroundColor: Pallete.whiteColor,
              child: SvgPicture.asset(
                'triple-chevron'.svg,
                height: 16.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
