import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routemaster/routemaster.dart';

class RemindersView extends ConsumerWidget {
  const RemindersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // using a bottom nav bar for adding new reminders
      bottomNavigationBar: Material(
        elevation: 5,
        child: Container(
          color: Pallete.whiteColor,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          height: 112.h,
          width: double.infinity,
          child: Center(
            child: BButton(
              onTap: () {},
              item: Text(
                'Add new reminder',
                style: TextStyle(
                  color: Pallete.whiteColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          71.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BButton(
                  width: 40.w,
                  height: 33.3.h,
                  radius: 5.r,
                  color: Pallete.backButtonGrey,
                  item: Icon(
                    Icons.arrow_back,
                    color: Pallete.blackColor,
                    size: 16.h,
                  ),
                  onTap: () {
                    Routemaster.of(context).pop();
                  },
                ),
                Text(
                  'Reminders',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 40.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'info'.svg,
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
