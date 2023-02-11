// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:betahealth/theme/palette.dart';

class EmergencyNumbersTile extends ConsumerWidget {
  final String number;
  const EmergencyNumbersTile({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        await FlutterPhoneDirectCaller.callNumber(number);
      },
      child: Container(
        height: 50.h,
        width: 145.w,
        // padding: EdgeInsets.symmetric(horizontal: 8.w),
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
            color: Pallete.whiteColor,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                  color: Pallete.tileShadow.withOpacity(0.5),
                  offset: const Offset(-1, 2),
                  blurRadius: 7),
            ]),
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
