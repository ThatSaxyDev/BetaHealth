// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:betahealth/core/constants/constants.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ArticlesTile extends ConsumerWidget {
  final String? imageUrl;
  final String? title;
  final String? content;
  final DateTime? publishedAt;
  const ArticlesTile({
    super.key,
    this.imageUrl,
    this.title,
    this.content,
    this.publishedAt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 99.h,
      width: 327.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      margin: EdgeInsets.only(bottom: 20.h),
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
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Pallete.primaryTeal),
              image: DecorationImage(
                image: NetworkImage(imageUrl ?? Constants.defaultArticleImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.w, top: 16.h, bottom: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Pallete.blackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                5.sbH,
                SizedBox(
                  width: 210.w,
                  child: Text(
                    content ?? title!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Pallete.blackColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
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
