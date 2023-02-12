import 'package:betahealth/features/auth/controllers/auth_controller.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends ConsumerWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 60.h,
                  width: 60.w,
                  child: const CircularProgressIndicator(),
                ),
              )
            : Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  50.sbH,
                  // SizedBox(
                  //   height: 300.h,
                  //   width: 250.w,
                  //   child: Image.asset(AppImages.appLogo),
                  // ),
                  // Spc(h: 60.h),

                  GButton(
                    padding: 10.h,
                    color: Pallete.greyColor,
                    item: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 30.w,
                          child: Image.asset('google'.png),
                        ),
                        Text(
                          'Continue with Google',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
