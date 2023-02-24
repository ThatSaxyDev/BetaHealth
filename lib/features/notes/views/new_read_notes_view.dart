// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:betahealth/features/notes/controllers/notes_controller.dart';
import 'package:betahealth/features/notes/views/update_note_view.dart';
import 'package:betahealth/shared/widgets/loader.dart';
import 'package:betahealth/shared/widgets/text_input.dart';
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

class NewReadNotesView extends ConsumerStatefulWidget {
  final NoteModel note;
  const NewReadNotesView({
    super.key,
    required this.note,
  });

  @override
  ConsumerState<NewReadNotesView> createState() => _NewReadNotesViewState();
}

class _NewReadNotesViewState extends ConsumerState<NewReadNotesView> {
  String? imageUrl = '';

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    imageUrl = widget.note.photo;
    titleController.text = widget.note.title;
    contentController.text = widget.note.content;
  }

  void updateNote() async {
    ref.read(notesControllerProvider.notifier).updateNote(
          context: context,
          theNote: widget.note,
          title: titleController.text.trim(),
          content: contentController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(notesControllerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              71.sbH,
              Row(
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
                    'Update Note',
                    style: TextStyle(
                      color: Pallete.blackColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          'info'.svg,
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // 26.67.sbH,

              // // image
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     'Add an image to your notes',
              //     style: TextStyle(
              //       color: Pallete.blackColor,
              //       fontSize: 16.sp,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              // 16.sbH,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         showModalBottomSheet(
              //           isScrollControlled: true,
              //           backgroundColor: Colors.transparent,
              //           context: context,
              //           builder: (_) => bottomSheet(),
              //         );
              //       },
              //       child: Container(
              //         height: 156.h,
              //         width: 150.h,
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Pallete.brownColor,
              //           ),
              //           borderRadius: BorderRadius.circular(15.r),
              //         ),
              //         child: Center(
              //           child: SvgPicture.asset('camera'.svg),
              //         ),
              //       ),
              //     ),

              //     // image containers
              //     Container(
              //       height: 156.h,
              //       width: 150.w,
              //       padding: EdgeInsets.zero,
              //       decoration: BoxDecoration(
              //           // color: Pallete.imagePlaceHolder1,
              //           border: Border.all(
              //             color: Pallete.brownColor,
              //           ),
              //           borderRadius: BorderRadius.circular(15.r),
              //           image: DecorationImage(
              //             image: widget.note.photo == null || widget.note.photo == ''
              //                 ? AssetImage('no-image'.png)
              //                 : FileImage(image!) as ImageProvider,
              //           )),
              //       // child:
              //       // //  images.isEmpty
              //       // //     ?
              //       //     Column(
              //       //         children: [
              //       //           // first row
              //       //           Expanded(
              //       //             flex: 1,
              //       //             child: Row(
              //       //               children: [
              //       //                 Expanded(
              //       //                   flex: 1,
              //       //                   child: Container(
              //       //                     decoration: BoxDecoration(
              //       //                       color: Pallete.imagePlaceHolder1,
              //       //                       borderRadius: BorderRadius.only(
              //       //                         topLeft: Radius.circular(15.r),
              //       //                       ),
              //       //                     ),
              //       //                     // child: images.isEmpty
              //       //                     //     ? null
              //       //                     //     : Image.file(images[0]),
              //       //                   ),
              //       //                 ),
              //       //                 Expanded(
              //       //                   flex: 1,
              //       //                   child: Container(
              //       //                     decoration: BoxDecoration(
              //       //                       color: Pallete.imagePlaceHolder2,
              //       //                       borderRadius: BorderRadius.only(
              //       //                         topRight: Radius.circular(15.r),
              //       //                       ),
              //       //                     ),
              //       //                     // child: images.isEmpty
              //       //                     //     ? null
              //       //                     //     : Image.file(images[1]),
              //       //                   ),
              //       //                 ),
              //       //               ],
              //       //             ),
              //       //           ),

              //       //           // second row
              //       //           Expanded(
              //       //             flex: 1,
              //       //             child: Row(
              //       //               children: [
              //       //                 Expanded(
              //       //                   flex: 1,
              //       //                   child: Container(
              //       //                     decoration: BoxDecoration(
              //       //                       color: Pallete.imagePlaceHolder3,
              //       //                       borderRadius: BorderRadius.only(
              //       //                         bottomLeft: Radius.circular(15.r),
              //       //                       ),
              //       //                     ),
              //       //                   ),
              //       //                 ),
              //       //                 Expanded(
              //       //                   flex: 1,
              //       //                   child: Container(
              //       //                     decoration: BoxDecoration(
              //       //                       color: Pallete.imagePlaceHolder4,
              //       //                       borderRadius: BorderRadius.only(
              //       //                         bottomRight: Radius.circular(15.r),
              //       //                       ),
              //       //                     ),
              //       //                   ),
              //       //                 ),
              //       //               ],
              //       //             ),
              //       //           ),
              //       //         ],
              //       //       ),
              //       // : CarouselSlider(
              //       //     items: images.map(
              //       //       (i) {
              //       //         return Builder(
              //       //           builder: (BuildContext context) => Image.file(
              //       //             i,
              //       //             fit: BoxFit.cover,
              //       //             height: 200.h,
              //       //           ),
              //       //         );
              //       //       },
              //       //     ).toList(),
              //       //     options: CarouselOptions(
              //       //       autoPlay: true,
              //       //       autoPlayInterval:
              //       //           const Duration(milliseconds: 2000),
              //       //       aspectRatio: 2.0,
              //       //       enlargeCenterPage: true,
              //       //       viewportFraction: 1,
              //       //       height: 150.h,
              //       //     ),
              //       //   ),
              //     ),
              //   ],
              // ),
              20.sbH,

              // Title
              TextFormField(
                controller: titleController,
                style: TextStyle(
                  color: Pallete.blackColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: Pallete.textGrey,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                ),
              ),

              const Divider(
                color: Pallete.greyColor,
              ),
              10.sbH,

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  DateFormat.yMMMEd().format(DateTime.now()),
                  style: TextStyle(
                    color: Pallete.textGrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              10.sbH,

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

              NoteInputBox(
                controller: contentController,
                keyboardType: TextInputType.multiline,
                maxLines: 24,
                hintText: 'Type a note',
              ),

              10.sbH,
              isLoading
                  ? const Loader()
                  : BButton(
                      onTap: updateNote,
                      item: Text(
                        'Save',
                        style: TextStyle(
                          color: Pallete.whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class DummyText {
  static const String dummyText =
      'Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenae. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenae.';
}
