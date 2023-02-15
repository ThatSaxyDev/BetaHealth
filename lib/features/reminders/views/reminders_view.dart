// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart' as pro;
import 'package:routemaster/routemaster.dart';

import 'package:betahealth/core/bloc/global_bloc.dart';
import 'package:betahealth/features/home/widgets/reminders_tile.dart';
import 'package:betahealth/features/reminders/views/add_reminder_view.dart';
import 'package:betahealth/features/reminders/views/reminder_details_view.dart';
import 'package:betahealth/models/medicine.dart';
import 'package:betahealth/shared/widgets/button.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:betahealth/utils/string_extensions.dart';
import 'package:betahealth/utils/widget_extensions.dart';

class RemindersView extends ConsumerWidget {
  final Medicine? medicine;
  const RemindersView({
    super.key,
    this.medicine,
  });

  void deleteReminder(GlobalBloc globalBloc, BuildContext context) async {
    globalBloc.removeMedicine(medicine!);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalBloc globalBloc = pro.Provider.of<GlobalBloc>(context);
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
                  'Reminders',
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
          ),
          25.sbH,
          StreamBuilder<List<Medicine>>(
              stream: globalBloc.medicineList$,
              builder: (context, snapshot) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'You currently have ',
                          style: TextStyle(
                            color: Pallete.blackColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: !snapshot.hasData
                              ? '0'
                              : snapshot.data!.length.toString(),
                          style: TextStyle(
                            color: Pallete.orange,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: snapshot.data!.length == 1
                              ? ' reminder'
                              : ' reminders',
                          style: TextStyle(
                            color: Pallete.blackColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          25.sbH,

          // list view for the reminder
          Expanded(
            child: StreamBuilder(
              stream: globalBloc.medicineList$,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  //if no data is saved
                  return const SizedBox.shrink();
                } else if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        90.sbH,
                        Image.asset('no-reminder'.png, height: 179.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'No',
                                style: TextStyle(
                                  color: Pallete.blackColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: ' reminders ',
                                style: TextStyle(
                                  color: Pallete.primaryTeal,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'made yet',
                                style: TextStyle(
                                  color: Pallete.blackColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        6.sbH,
                        Text(
                          'Want to set one?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 27.h),
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        key: UniqueKey(),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          dismissible: DismissiblePane(onDismissed: () {
                            deleteReminder(globalBloc, context);
                          }),
                          children: [
                            //! DELETE
                            SlidableAction(
                                flex: 1,
                                onPressed: (value) {
                                  deleteReminder(globalBloc, context);
                                },
                                backgroundColor:
                                    Pallete.thickRed.withOpacity(0.2),
                                foregroundColor: Pallete.thickRed,
                                icon: PhosphorIcons.trashSimpleFill),
                          ],
                        ),
                        child: RemindersTile(
                          medicine: snapshot.data![index],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),

      // using a bottom nav bar for adding new reminders
      bottomNavigationBar: Material(
        elevation: 0,
        child: Container(
          color: Pallete.whiteColor,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          height: 112.h,
          width: double.infinity,
          child: Center(
            child: BButton(
              onTap: () {
                // go to new entry page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddReminderView(),
                  ),
                );
              },
              item: Text(
                'Add new reminder',
                style: TextStyle(
                  color: Pallete.whiteColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
