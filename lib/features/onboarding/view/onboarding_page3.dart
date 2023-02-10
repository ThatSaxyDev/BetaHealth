import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.orange,
      child: Column(
        children: [
          184.sbH,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Get',
              style: TextStyle(
                color: Pallete.blackColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: ' Help ',
                  style: TextStyle(
                    color: Pallete.whiteColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'faster and all in\none',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: ' Click',
                  style: TextStyle(
                    color: Pallete.whiteColor,
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
            child: Image.asset('bus'.gif),
          ),
          8.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.w),
            child: Text(
              'You have access to various emergency services numbers, in case you need help',
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GButton(
              padding: 10.h,
              color: Pallete.whiteColor,
              item: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30.w,
                    child: SvgPicture.asset('google'.svg),
                  ),
                  10.sbW,
                  Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: Pallete.orange,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
