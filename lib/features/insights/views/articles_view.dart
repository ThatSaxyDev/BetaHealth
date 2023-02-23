import 'package:betahealth/core/constants/constants.dart';
import 'package:betahealth/features/insights/repos/insights_repo.dart';
import 'package:betahealth/features/insights/views/articles_web_view.dart';
import 'package:betahealth/features/insights/widgets/articles_tile.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shimmer/shimmer.dart';

class ArticlesView extends ConsumerWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articlesDataProvider);
    return Scaffold(
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
                  'Articles',
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
            child: articles.when(
              data: (data) {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 25.h,
                  ),
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ArticlesWebView(
                            url: data[index].url!,
                          ),
                        ));
                      },
                      child: ArticlesTile(
                        title: data[index].title,
                        imageUrl: data[index].urlToImage,
                        content: data[index].description,
                        publishedAt: data[index].publishedAt,
                      ),
                    );
                  },
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => Shimmer.fromColors(
                baseColor: Pallete.greey,
                highlightColor: Pallete.whiteColor,
                enabled: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) => Container(
                      width: 116.w,
                      margin: EdgeInsets.only(right: 13.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
