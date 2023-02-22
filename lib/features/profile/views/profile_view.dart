// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routemaster/routemaster.dart';

import 'package:betahealth/features/auth/controllers/auth_controller.dart';
import 'package:betahealth/features/profile/widgets/profile_tile.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  void logOut(WidgetRef ref) async {
    ref.read(authControllerProvider.notifier).logOut();
  }

  void navigateToReminders(BuildContext context) {
    Routemaster.of(context).push('/reminders');
  }

  void navigateToNewSymptoms(BuildContext context) {
    Routemaster.of(context).push('/new-symptoms');
  }

  void showlogOutDialog(WidgetRef ref, BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () {
                  Routemaster.of(context).pop();
                  logOut(ref);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Routemaster.of(context).pop();
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
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
                    //! header
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Pallete.blackColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    8.sbH,
                    Text(
                      '',
                      style: TextStyle(
                        color: Pallete.blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                40.sbW,
              ],
            ),
          ),

          //! profile photo and name
          Row(
            children: [
              24.sbW,
              CircleAvatar(
                radius: 25.w,
                backgroundColor: Pallete.greey,
                backgroundImage: NetworkImage(user.profilePic),
              ),
              10.sbW,
              Text(
                user.name,
                style: TextStyle(
                  color: Pallete.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          24.sbH,

          Column(
            children: profileItems
                .map(
                  (e) => ProfileTile(
                    onTap: () {
                      switch (e.title) {
                        case 'Reminders':
                          navigateToReminders(context);
                          break;

                        case 'Add new symptoms':
                          navigateToNewSymptoms(context);
                          break;
                      }
                    },
                    icon: e.icon,
                    title: e.title,
                  ),
                )
                .toList(),
          ),
          const Spacer(),

          // Divider(
          //   color: Pallete.brownColor.withOpacity(0.3),
          // ),

          // SizedBox(height: 229.h),
          // //! TODO: implement the listview for suggestions
          // Divider(
          //   color: Pallete.brownColor.withOpacity(0.3),
          // ),
          ProfileTile(
            onTap: () => showlogOutDialog(ref, context),
            icon: 'logout',
            title: 'Log out',
          ),
          30.sbH,
        ],
      ),
    );
  }
}

class ProfileItem {
  final String icon;
  final String title;
  const ProfileItem({
    required this.icon,
    required this.title,
  });
}

const profileItems = [
  ProfileItem(icon: 'newBell', title: 'Reminders'),
  ProfileItem(icon: 'insights', title: 'Find nearby hospitals'),
  ProfileItem(icon: 'add', title: 'Add new symptoms'),
];

// Expanded(
//   child: Center(
//     child: BButton(
//       width: 200.w,
//       onTap: () => showlogOutDialog(ref, context),
//       item: Text(
//         'Log out',
//         style: TextStyle(
//           color: Pallete.whiteColor,
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     ),
//   ),
// ),
