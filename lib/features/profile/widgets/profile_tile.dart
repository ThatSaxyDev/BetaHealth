// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:betahealth/core/bloc/global_bloc.dart';
import 'package:betahealth/models/medicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:routemaster/routemaster.dart';

import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:provider/provider.dart' as pro;

class ProfileTile extends ConsumerWidget {
  final String icon;
  final String title;
  final bool? isReminder;
  final void Function()? onTap;
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    this.isReminder = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalBloc globalBloc = pro.Provider.of<GlobalBloc>(context);
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
            isReminder == true
                ? StreamBuilder<List<Medicine>>(
                    stream: globalBloc.medicineList$,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return CircleAvatar(
                          backgroundColor: Pallete.primaryTeal,
                          radius: 10,
                          child: Text(
                            snapshot.data!.length.toString(),
                            style: TextStyle(
                              color: Pallete.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                        );
                      } else {
                        return Icon(Icons.arrow_forward_ios_rounded, size: 17.h);
                      }
                    },
                  )
                : Icon(Icons.arrow_forward_ios_rounded, size: 17.h),
          ],
        ),
      ),
    );
  }
}
