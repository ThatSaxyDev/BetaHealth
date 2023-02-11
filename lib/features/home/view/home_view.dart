import 'package:betahealth/features/auth/controllers/auth_controller.dart';
import 'package:betahealth/features/home/widgets/reminders_tile.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    String userName = user.name;
    List<String> name = userName.split(' ');
    String firstName = name[0];
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
                    20.sbH,
                    Text(
                      'Hello, $firstName',
                      style: TextStyle(
                        color: Pallete.blackColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    8.sbH,
                    Text(
                      'How are you doing today?',
                      style: TextStyle(
                        color: Pallete.blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                TTransparentButton(
                  onTap: () {},
                  color: Pallete.primaryTeal,
                  child: SvgPicture.asset('bell'.svg),
                ),
              ],
            ),
          ),
          29.sbH,
          SizedBox(
            height: 142.h,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              itemCount: homeViewSliderContent.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 318.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                          image: AssetImage(homeViewSliderContent[index].png)),
                    ),
                  ),
                );
              },
            ),
          ),
          27.sbH,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                'Reminders',
                style: TextStyle(
                  color: Pallete.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 153.h,
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 27.h),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return RemindersTile(
                  icon: reminderIcons[index],
                );
              },
            ),
          ),
          27.sbH,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                'Insights',
                style: TextStyle(
                  color: Pallete.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          16.sbH,
          SizedBox(
            height: 106.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: insightImages.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100.w,
                  margin: EdgeInsets.only(right: 13.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Pallete.primaryTeal),
                    image: DecorationImage(
                        image: AssetImage(insightImages[index].png),
                        fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

const homeViewSliderContent = [
  'visit-hospital',
  'medications',
];

const reminderIcons = [
  'green-reminder',
  'yellow-reminder',
];

const insightImages = [
  'insight-1',
  'insight-2',
  'insight-3',
  'insight-1',
  'insight-2',
  'insight-3',
];

//! FOR THE REMINDER SECTION
//! I'LL CHECK FOR THE CURRENT TIME, THEN SELECT THE NEAREST TWO REMINDERS TO THE TIME AND DISPLAY IT
