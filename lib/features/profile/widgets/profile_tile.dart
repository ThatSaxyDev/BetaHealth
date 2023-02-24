// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:routemaster/routemaster.dart';
import 'package:betahealth/theme/palette.dart';

class ProfileTile extends ConsumerWidget {
  final String icon;
  final String title;
  final void Function()? onTap;
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 60.h,
        padding: EdgeInsets.only(left: 11.w, right: 19.43.h),
        margin: EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
        decoration: BoxDecoration(
          color: Pallete.whiteColor,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
                color: Pallete.tileShadow.withOpacity(0.5),
                offset: const Offset(-1, 2),
                blurRadius: 7),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon.svg,
              height: 20.h,
            ),
            13.5.sbW,
            Text(
              title,
              style: TextStyle(
                color: Pallete.blackTint,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios_rounded, size: 17.h),
          ],
        ),
      ),
    );
  }
}
