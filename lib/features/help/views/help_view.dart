import 'package:betahealth/features/help/widgets/emergency_tile.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routemaster/routemaster.dart';

class HelpView extends ConsumerWidget {
  const HelpView({super.key});

  void navigateToNewSymptoms(BuildContext context) {
    Routemaster.of(context).push('/new-symptoms');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          71.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 20.sbH,
                    Text(
                      'Help',
                      style: TextStyle(
                        color: Pallete.blackColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    8.sbH,
                    Text(
                      'Get access to health advice,\nemergency services numbers.',
                      style: TextStyle(
                        color: Pallete.blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                // TTransparentButton(
                //   onTap: () {},
                //   color: Pallete.primaryTeal,
                //   child: SvgPicture.asset('bell'.svg),
                // ),
                40.sbW,
              ],
            ),
          ),
          27.sbH,
          const EmergencyTile(),
          27.sbH,

          // section for thw symptoms list, or add symptoms
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'You haven\'t logged in any symptom yet, you can log in now, so we can help.',
                      style: TextStyle(
                        color: Pallete.blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Image.asset(
                    'heart'.png,
                    height: 162.42.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 17.h),
                    child: BButton(
                      width: 327.w,
                      onTap: () => navigateToNewSymptoms(context),
                      item: Text(
                        'Add symptoms',
                        style: TextStyle(
                          color: Pallete.whiteColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
