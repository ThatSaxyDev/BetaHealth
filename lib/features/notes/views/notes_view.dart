import 'package:betahealth/features/auth/controllers/auth_controller.dart';
import 'package:betahealth/features/notes/controllers/notes_controller.dart';
import 'package:betahealth/features/notes/delegates/search_notes_delegate.dart';
import 'package:betahealth/features/notes/views/new_read_notes_view.dart';
import 'package:betahealth/features/notes/views/read_notes_view.dart';
import 'package:betahealth/features/notes/widgets/notes_tile.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/shared/widgets/error_text.dart';
import 'package:betahealth/shared/widgets/loader.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:routemaster/routemaster.dart';

class NotesView extends ConsumerStatefulWidget {
  const NotesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotesViewState();
}

class _NotesViewState extends ConsumerState<NotesView> {
  void navigateToAddNotes(BuildContext context) {
    Routemaster.of(context).push('/add-notes');
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          73.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 211.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Note',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.sbH,
                      Text(
                        'Drop records on your health\nand let us help you monitor\nyour health',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                // button
                TTransparentButton(
                  onTap: () {
                    showSearch(
                        context: context,
                        delegate: SearchNoteDelegate(ref));
                  },
                  color: Pallete.primaryTeal,
                  child: const Icon(
                    PhosphorIcons.magnifyingGlass,
                    color: Pallete.primaryTeal,
                  ),
                ),
              ],
            ),
          ),
          27.sbH,
          Consumer(
            builder: (context, ref, child) {
              return ref.watch(getUserNotesProvider(user.uid)).when(
                    data: (data) {
                      if (data.isEmpty) {
                        return Expanded(
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              height: 297.h,
                              child: Column(
                                children: [
                                  Image.asset('no-notes'.png, height: 200.h),
                                  const Spacer(),
                                  Text(
                                    'No note here at the moment',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  12.sbH,
                                  InkWell(
                                    onTap: () => navigateToAddNotes(context),
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Text(
                                      '+ Add New Note',
                                      style: TextStyle(
                                        color: Pallete.primaryPurple,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      return Column(
                        children: [
                          SizedBox(
                            height: 455.h,
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 10.h),
                              physics: const AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final note = data[index];

                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        // return ReadNotesView(note: note);
                                        return NewReadNotesView(note: note);
                                      },
                                    ));
                                  },
                                  child: NotesTile(
                                    note: note,
                                  ),
                                );
                              },
                            ),
                          ),
                          15.sbH,
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => navigateToAddNotes(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '+ Add New Note',
                                  style: TextStyle(
                                    color: Pallete.primaryPurple,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                13.sbW,
                                Container(
                                  height: 40.h,
                                  width: 46.8.w,
                                  decoration: BoxDecoration(
                                      color: Pallete.whiteColor,
                                      borderRadius: BorderRadius.circular(15.r),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Pallete.tileShadow
                                                .withOpacity(0.3),
                                            offset: const Offset(-1, 2),
                                            blurRadius: 7),
                                      ]),
                                  child: Center(
                                    child: SvgPicture.asset('new-note'.svg),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      if (kDebugMode) print(error);
                      return ErrorText(error: error.toString());
                    },
                    loading: () => const Loader(),
                  );
            },
          ),
        ],
      ),
    );
  }
}
