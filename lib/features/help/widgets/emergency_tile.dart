import 'package:betahealth/features/help/widgets/emergency_line_bottom_sheet.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class EmergencyTile extends ConsumerWidget {
  const EmergencyTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) => Wrap(
            children: const [
              EmergencyLinesBottomSheet(),
            ],
          ),
        );
      },
      child: Container(
        height: 68.h,
        width: 327.w,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
        // margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
            color: Pallete.whiteColor,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                  color: Pallete.tileShadow.withOpacity(0.5),
                  offset: const Offset(-1, 2),
                  blurRadius: 7),
            ]),
        child: Row(
          children: [
            CircleAvatar(
              radius: 27.5.w,
              backgroundColor: Pallete.tileShadow.withOpacity(0.09),
              child: SvgPicture.asset('emergency'.svg),
            ),
            8.sbW,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Emergency Services Numbers',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                6.sbH,
                Text(
                  'Gorem ipsum dolor sit amet, consectetur amet',
                  style: TextStyle(
                    color: Pallete.textGrey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
