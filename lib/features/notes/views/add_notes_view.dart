import 'dart:developer';
import 'dart:io';

import 'package:betahealth/features/notes/controllers/notes_controller.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/shared/widgets/loader.dart';
import 'package:betahealth/shared/widgets/text_input.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/picker.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

class AddNotesView extends ConsumerStatefulWidget {
  const AddNotesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddNotesViewState();
}

class _AddNotesViewState extends ConsumerState<AddNotesView> {
  // List<File> images = [];
  File? image;

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void takePhoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);

      print(image.name);
    } on PlatformException catch (e) {
      print('Failed to pick images: $e');
    }
  }

  void addNote() async {
    if (titleController.text.isNotEmpty &&
        contentController.text.isNotEmpty &&
        image != null) {
      ref.read(notesControllerProvider.notifier).addNote(
            context: context,
            title: titleController.text.trim(),
            content: contentController.text.trim(),
            file: image,
          );
    } else if (titleController.text.isNotEmpty &&
        contentController.text.isNotEmpty) {
      ref.read(notesControllerProvider.notifier).addNote(
            context: context,
            title: titleController.text.trim(),
            content: contentController.text.trim(),
          );
    }
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
                    'New Note',
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
              26.67.sbH,

              // image
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Add an image to your notes',
                  style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              16.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (_) => bottomSheet(),
                      );
                    },
                    child: Container(
                      height: 156.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Pallete.brownColor,
                        ),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                        child: SvgPicture.asset('camera'.svg),
                      ),
                    ),
                  ),

                  // image containers
                  Container(
                    height: 156.h,
                    width: 150.w,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        // color: Pallete.imagePlaceHolder1,
                        border: Border.all(
                          color: Pallete.brownColor,
                        ),
                        borderRadius: BorderRadius.circular(15.r),
                        image: DecorationImage(
                          image: image == null
                              ? AssetImage('no-image'.png)
                              : FileImage(image!) as ImageProvider,
                        )),
                    // child:
                    // //  images.isEmpty
                    // //     ?
                    //     Column(
                    //         children: [
                    //           // first row
                    //           Expanded(
                    //             flex: 1,
                    //             child: Row(
                    //               children: [
                    //                 Expanded(
                    //                   flex: 1,
                    //                   child: Container(
                    //                     decoration: BoxDecoration(
                    //                       color: Pallete.imagePlaceHolder1,
                    //                       borderRadius: BorderRadius.only(
                    //                         topLeft: Radius.circular(15.r),
                    //                       ),
                    //                     ),
                    //                     // child: images.isEmpty
                    //                     //     ? null
                    //                     //     : Image.file(images[0]),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   flex: 1,
                    //                   child: Container(
                    //                     decoration: BoxDecoration(
                    //                       color: Pallete.imagePlaceHolder2,
                    //                       borderRadius: BorderRadius.only(
                    //                         topRight: Radius.circular(15.r),
                    //                       ),
                    //                     ),
                    //                     // child: images.isEmpty
                    //                     //     ? null
                    //                     //     : Image.file(images[1]),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),

                    //           // second row
                    //           Expanded(
                    //             flex: 1,
                    //             child: Row(
                    //               children: [
                    //                 Expanded(
                    //                   flex: 1,
                    //                   child: Container(
                    //                     decoration: BoxDecoration(
                    //                       color: Pallete.imagePlaceHolder3,
                    //                       borderRadius: BorderRadius.only(
                    //                         bottomLeft: Radius.circular(15.r),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   flex: 1,
                    //                   child: Container(
                    //                     decoration: BoxDecoration(
                    //                       color: Pallete.imagePlaceHolder4,
                    //                       borderRadius: BorderRadius.only(
                    //                         bottomRight: Radius.circular(15.r),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    // : CarouselSlider(
                    //     items: images.map(
                    //       (i) {
                    //         return Builder(
                    //           builder: (BuildContext context) => Image.file(
                    //             i,
                    //             fit: BoxFit.cover,
                    //             height: 200.h,
                    //           ),
                    //         );
                    //       },
                    //     ).toList(),
                    //     options: CarouselOptions(
                    //       autoPlay: true,
                    //       autoPlayInterval:
                    //           const Duration(milliseconds: 2000),
                    //       aspectRatio: 2.0,
                    //       enlargeCenterPage: true,
                    //       viewportFraction: 1,
                    //       height: 150.h,
                    //     ),
                    //   ),
                  ),
                ],
              ),
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

              NoteInputBox(
                controller: contentController,
                keyboardType: TextInputType.multiline,
                maxLines: 12,
                hintText: 'Type a note',
              ),

              10.sbH,
              isLoading
                  ? const Loader()
                  : BButton(
                      onTap: addNote,
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

  Widget bottomSheet() {
    return Container(
      decoration: BoxDecoration(
          color: Pallete.whiteColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.r))),
      height: 150.h,
      width: double.infinity,
      child: Column(
        children: [
          //! SPACER
          20.sbH,

          //! NOTICE
          Text('Choose profile photo',
              style: TextStyle(
                  color: Pallete.primaryTeal,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700)),

          //! SPACER
          20.sbH,

          //! OPTIONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //! CAMERA
              IconButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  takePhoto(ImageSource.camera);
                },
                icon: const Icon(Icons.camera_alt, color: Pallete.primaryTeal),
              ),

              //! GALLERY
              IconButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  takePhoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.photo, color: Pallete.primaryTeal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
