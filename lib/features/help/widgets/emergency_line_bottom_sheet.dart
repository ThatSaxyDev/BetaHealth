import 'package:betahealth/features/help/widgets/emergency_numbers_tile.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmergencyLinesBottomSheet extends ConsumerWidget {
  const EmergencyLinesBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.89,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Pallete.whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          24.sbH,
          // bar
          Container(
            height: 5.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: Pallete.greey,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          //! TODO: gif for emergency phone
          Image.asset('call'.gif, height: 65.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Emergency ',
                  style: TextStyle(
                    color: Pallete.thickRed,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Services Number',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          27.sbH,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      'If you can\'t find what you need, an alternative is\nto dial: ',
                  style: TextStyle(
                    color: Pallete.blackTint,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await FlutterPhoneDirectCaller.callNumber('112');
                    },
                  text: '112',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Pallete.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: ' or ',
                  style: TextStyle(
                    color: Pallete.blackTint,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await FlutterPhoneDirectCaller.callNumber('199');
                    },
                  text: '199',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Pallete.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          33.sbH,
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                padding: EdgeInsets.only(left: 24.w, right: 48.w),
                children: [
                  Text(
                    'Nigerian Police Emergency Lines:',
                    style: TextStyle(
                      color: Pallete.blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  16.sbH,

                  //! Nigerian Police Emergency Lines
                  Row(
                    children: [
                      const EmergencyNumbersTile(number: '01-4931260'),
                      13.sbW,
                      const EmergencyNumbersTile(number: '01-4931260'),
                    ],
                  ),
                  28.sbH,

                  Text(
                    'Lagos State Traffic Management Authority:',
                    style: TextStyle(
                      color: Pallete.blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  16.sbH,

                  //! Lagos State Traffic Management Authority:
                  Wrap(
                    children: [
                      const EmergencyNumbersTile(number: '08023909364'),
                      13.sbW,
                      const EmergencyNumbersTile(number: '08075005411'),
                      const EmergencyNumbersTile(number: '0802311742'),
                    ],
                  ),

                  28.sbH,

                  Text(
                    'Rapid Response Squad:',
                    style: TextStyle(
                      color: Pallete.blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  16.sbH,

                  //! Rapid Response Squad:
                  Wrap(
                    children: [
                      const EmergencyNumbersTile(number: '070-55350249'),
                      13.sbW,
                      const EmergencyNumbersTile(number: '070-35068242'),
                      const EmergencyNumbersTile(number: '080-79279349'),
                    ],
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
