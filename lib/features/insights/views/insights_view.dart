import 'package:betahealth/features/home/view/home_view.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InsightsView extends ConsumerWidget {
  const InsightsView({super.key});

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
                      'Insights',
                      style: TextStyle(
                        color: Pallete.blackColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    8.sbH,
                    Text(
                      'Want to learn more about your\nhealth? Check these out',
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
          40.sbH,

          //! quizzes
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quizzes',
                  style: TextStyle(
                    color: Pallete.textGreen,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See More',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Pallete.textGreen,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.sbH,
          SizedBox(
            height: 99.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: insightImages.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 125.w,
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

          28.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Articles',
                  style: TextStyle(
                    color: Pallete.primaryTeal,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See More',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Pallete.primaryTeal,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.sbH,
          SizedBox(
            height: 133.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: insightImages.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 116.w,
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

          28.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Articles',
                  style: TextStyle(
                    color: Pallete.primaryPurple,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See More',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Pallete.primaryPurple,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.sbH,
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: insightImages.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 163.w,
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
