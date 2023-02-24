import 'package:betahealth/core/constants/constants.dart';
import 'package:betahealth/features/insights/controllers/insights_controller.dart';
import 'package:betahealth/features/insights/repos/insights_repo.dart';
import 'package:betahealth/features/insights/views/articles_web_view.dart';
import 'package:betahealth/features/insights/widgets/articles_tile.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/shared/widgets/loader.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shimmer/shimmer.dart';

class VideosView extends ConsumerWidget {
  const VideosView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(getVideosProvider);
    return Scaffold(
      body: Column(
        children: [
          71.sbH,
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 21.w).copyWith(bottom: 10.h),
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
                  'Videos',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 40.w,
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     SvgPicture.asset(
                  //       'info'.svg,
                  //       height: 20.h,
                  //     ),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
          Expanded(
            child: videos.when(
              data: (data) {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 15.h,
                  ),
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ArticlesWebView(
                            url: data[index].videoUrl,
                            isFromVideos: true,
                          ),
                        ));
                      },
                      child: Container(
                        height: 217.h,
                        margin: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: Pallete.primaryTeal),
                          image: DecorationImage(
                            image: NetworkImage(data[index].thumb),
                            fit: BoxFit.cover,
                            onError: (exception, stackTrace) => DecorationImage(
                              image: AssetImage('videoPlaceHolder'.png),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            49.sbH,
                            Container(
                            height: 45.h,
                            width: 65.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Pallete.thickRed,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.play_arrow_rounded,
                                color: Pallete.whiteColor,
                                size: 15.h,
                              ),
                            ),
                          ),
                            Container(
                              height: 49.h,
                              decoration: BoxDecoration(
                                color: Pallete.offWhiteTeal,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  bottomRight: Radius.circular(15.r),
                                ),
                              ),
                              child: Row(
                                children: [
                                  9.sbW,
                                  SizedBox(
                                    width: 150.w,
                                    child: Text(
                                      data[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
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
                  },
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(child: Loader()),
            ),
          ),
        ],
      ),
    );
  }
}
