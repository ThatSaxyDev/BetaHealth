import 'package:betahealth/features/auth/controllers/auth_controller.dart';
import 'package:betahealth/features/onboarding/view/onboarding_page1.dart';
import 'package:betahealth/features/onboarding/view/onboarding_page2.dart';
import 'package:betahealth/features/onboarding/view/onboarding_page3.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/shared/widgets/loader.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  final PageController _controller = PageController();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return isLoading
        ? const Scaffold(body: Loader())
        : Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  // pages
                  PageView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    pageSnapping: true,
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        page = value;
                      });
                    },
                    children: [
                      OnboardingPage1(
                        onTap: () {
                          setState(() {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            page++;
                          });
                        },
                      ),
                      OnboardingPage2(
                        onTap: () {
                          setState(() {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            page++;
                          });
                        },
                      ),
                      const OnboardingPage3()
                    ],
                  ),
                  // dots indicator and skip
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 31.w),
                    child: Column(
                      children: [
                        70.sbH,
                        if (page != 2)
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () async {
                                // //! SAVE PREF
                                // final SharedPreferences pref =
                                //     await SharedPreferences.getInstance();

                                // pref.setBool("showHome", true).whenComplete(() =>
                                //     Navigator.of(context).pushAndRemoveUntil(
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 const ConsumerSignUpScreen()),
                                //         (route) => false));
                              },
                              child: TransparentButton(
                                height: 30.h,
                                width: 87.w,
                                onTap: () {
                                  setState(() {
                                    _controller.jumpToPage(2);
                                    page++;
                                  });
                                },
                                color: page == 1
                                    ? Pallete.whiteColor
                                    : Pallete.primaryTeal,
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: page == 1
                                        ? Pallete.whiteColor
                                        : Pallete.primaryTeal,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              // Text(
                              //   'Skip',
                              //   style: TextStyle(
                              //     color: page == 1
                              //         ? AppColors.neutralWhite
                              //         : AppColors.purple,
                              //     fontSize: 14.sp,
                              //     fontWeight: FontWeight.w600,
                              //   ),
                              // ),
                            ),
                          ),
                        500.sbH,
                        if (page != 2)
                          Align(
                            alignment: Alignment.center,
                            child: SmoothPageIndicator(
                              controller: _controller,
                              count: 3,
                              effect: WormEffect(
                                // expansionFactor: 5,
                                dotWidth: 4.w,
                                dotHeight: 4.h,
                                dotColor: Pallete.greyColor,
                                activeDotColor: page == 1
                                    ? Pallete.whiteColor
                                    : Pallete.primaryTeal,
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
  }
}
