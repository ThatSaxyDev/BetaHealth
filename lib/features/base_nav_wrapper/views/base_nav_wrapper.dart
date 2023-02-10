import 'package:betahealth/features/auth/controllers/auth_controller.dart';
import 'package:betahealth/features/auth/views/home_view.dart';
import 'package:betahealth/features/base_nav_wrapper/widgets/nav_bar_widget.dart';
import 'package:betahealth/features/notes/views/notes_view.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseNavWrapper extends ConsumerStatefulWidget {
  const BaseNavWrapper({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseNavWrapperState();
}

class _BaseNavWrapperState extends ConsumerState<BaseNavWrapper> {
  List<Widget> pages = const [
    NotesView(),
    Center(
      child: Text('Insights View'),
    ),
    HomeView(),
    Center(
      child: Text('Help View'),
    ),
    Center(
      child: Text('Profile View'),
    ),
  ];

  final ValueNotifier<int> _page = ValueNotifier(0);

  void logOut(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).logOut();
  }

  @override
  void initState() {
    super.initState();
    _page.value = 2;
  }

  @override
  void dispose() {
    _page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;

    return Scaffold(
      // pages
      body: ValueListenableBuilder(
        valueListenable: _page,
        builder: (context, value, child) => pages[_page.value],
      ),

      // nav bar
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _page,
        builder: (context, value, child) => Material(
          elevation: 5,
          // nav bar content
          child: Container(
            color: Pallete.whiteColor,
            padding: EdgeInsets.only(top: 17.h, left: 17.w, right: 17.w),
            height: 75.h,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //! Notes
                NavBarWidget(
                  onTap: () => _page.value = 0,
                  icon: _page.value == 0 ? 'notes-filled' : 'notes',
                  label: 'Notes',
                  color: _page.value == 0 ? Pallete.primaryTeal : null,
                  fontWeight: _page.value == 0 ? FontWeight.w600 : null,
                ),

                //! Insights
                NavBarWidget(
                  onTap: () => _page.value = 1,
                  icon: 'insights',
                  label: 'Insights',
                  iconColor: _page.value == 1 ? Pallete.primaryTeal : null,
                  color: _page.value == 1 ? Pallete.primaryTeal : null,
                  fontWeight: _page.value == 1 ? FontWeight.w600 : null,
                ),

                //! Home
                NavBarWidget(
                  onTap: () => _page.value = 2,
                  icon: 'home',
                  label: 'Home',
                  color: _page.value == 2 ? Pallete.primaryTeal : null,
                  fontWeight: _page.value == 2 ? FontWeight.w600 : null,
                ),

                //! Help
                NavBarWidget(
                  onTap: () => _page.value = 3,
                  icon: _page.value == 3 ? 'help-filled' : 'help',
                  label: 'Help',
                  color: _page.value == 3 ? Pallete.primaryTeal : null,
                  fontWeight: _page.value == 3 ? FontWeight.w600 : null,
                ),

                //! Profile
                NavBarWidget(
                  onTap: () => _page.value = 4,
                  icon: 'profile',
                  label: 'Profile',
                  color: _page.value == 4 ? Pallete.primaryTeal : null,
                  fontWeight: _page.value == 4 ? FontWeight.w600 : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}