import 'package:betahealth/core/bloc/global_bloc.dart';
import 'package:betahealth/features/auth/controllers/auth_controller.dart';
import 'package:betahealth/features/home/widgets/reminders_tile.dart';
import 'package:betahealth/models/medicine.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routemaster/routemaster.dart';
import 'package:provider/provider.dart' as pro;

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  void navigateToReminders(BuildContext context) {
    Routemaster.of(context).push('/reminders');
  }

  void navigateToAddReminders(BuildContext context) {
    Routemaster.of(context).push('/add-reminders');
  }

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    final GlobalBloc globalBloc = pro.Provider.of<GlobalBloc>(context);
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
                    // 20.sbH,
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
                  onTap: () {
                    switch (index) {
                      case 1:
                        navigateToReminders(context);
                        break;
                    }
                  },
                  child: Container(
                    width: 318.w,
                    margin: EdgeInsets.only(right: 10.w),
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
            child: StreamBuilder<List<Medicine>>(
                stream: globalBloc.medicineList$,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    //if no data is saved
                    return const SizedBox.shrink();
                  } else if (snapshot.data!.isEmpty) {
                    return Center(
                      child: SizedBox(
                        height: 112.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'no-reminder'.png,
                              height: 112.h,
                            ),
                            10.sbW,
                            SizedBox(
                              height: 80.h,
                              width: 180.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'No reminders made yet\n',
                                          style: TextStyle(
                                            color: Pallete.blackColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Want to set one?',
                                          style: TextStyle(
                                            color: Pallete.primaryTeal,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  BButton(
                                    height: 30.h,
                                    width: 87.w,
                                    color: Pallete.blue,
                                    onTap: () => navigateToAddReminders(context),
                                    item: Text(
                                      'Add reminder',
                                      style: TextStyle(
                                        color: Pallete.whiteColor,
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 27.h),
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return RemindersTile(medicine: snapshot.data![index]);
                      },
                    );
                  }
                }),
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
