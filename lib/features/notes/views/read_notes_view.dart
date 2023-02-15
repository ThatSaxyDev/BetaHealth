// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:betahealth/features/notes/views/update_note_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

import 'package:betahealth/models/note_model.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';

class ReadNotesView extends StatefulWidget {
  final NoteModel note;
  const ReadNotesView({
    super.key,
    required this.note,
  });

  @override
  State<ReadNotesView> createState() => _ReadNotesViewState();
}

class _ReadNotesViewState extends State<ReadNotesView> {
  String? imageUrl = '';

  @override
  void initState() {
    super.initState();
    imageUrl = widget.note.photo;
  }

  @override
  Widget build(BuildContext context) {
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
                  'Note',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return UpdateNotesView(note: widget.note);
                      },
                    ));
                  },
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: Pallete.whiteColor,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [
                          BoxShadow(
                              color: Pallete.tileShadow.withOpacity(0.5),
                              offset: const Offset(-1, 2),
                              blurRadius: 7),
                        ]),
                    child: Center(
                      child: SvgPicture.asset(
                        'new-note'.svg,
                        height: 11.35.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          25.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.note.title,
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  DateFormat.yMMMEd().format(DateTime.now()),
                  style: TextStyle(
                    color: Pallete.textGrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          20.sbH,
          const Divider(
            color: Pallete.textGrey,
          ),
          10.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                padding: EdgeInsets.zero,
                children: [
                  imageUrl!.isEmpty || imageUrl == null
                      ? const SizedBox.shrink()
                      : Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              //   child: SizedBox(
                              //     height: 93.6.h,
                              //     width: 90.w,
                              //     child: CachedNetworkImage(
                              //       imageUrl: imageUrl!,
                              //       progressIndicatorBuilder: (context, url,
                              //               downloadProgress) =>
                              //           CircularProgressIndicator(
                              //               backgroundColor: Pallete.primaryTeal
                              //                   .withOpacity(0.3),
                              //               color: Pallete.primaryTeal,
                              //               value: downloadProgress.progress),
                              //       errorWidget: (context, url, error) =>
                              //           const Icon(Icons.error),
                              //       fit: BoxFit.fill,
                              //     ),
                              //   ),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) => Wrap(
                                      children: [
                                        Container(
                                          height: 450.h,
                                          padding: EdgeInsets.all(20.w),
                                          decoration: BoxDecoration(
                                            color: Pallete.whiteColor,
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(30.r),
                                            ),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Pallete.primaryTeal,
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      widget.note.photo!),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 93.6.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      color: Pallete.primaryTeal,
                                      borderRadius: BorderRadius.circular(16.r),
                                      image: DecorationImage(
                                        image: NetworkImage(widget.note.photo!),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),
                            37.4.sbH,
                          ],
                        ),
                  Text(
                    widget.note.content,
                    style: TextStyle(
                      color: Pallete.blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DummyText {
  static const String dummyText =
      'Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenae. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenae.';
}
