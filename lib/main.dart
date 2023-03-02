import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:betahealth/core/bloc/global_bloc.dart';
import 'package:betahealth/core/notifications/notifications_controller.dart';
import 'package:betahealth/features/auth/controllers/auth_controller.dart';
import 'package:betahealth/features/auth/views/auth_view.dart';
import 'package:betahealth/firebase_options.dart';
import 'package:betahealth/models/user_model.dart';
import 'package:betahealth/router.dart';
import 'package:betahealth/shared/widgets/error_text.dart';
import 'package:betahealth/shared/widgets/loader.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routemaster/routemaster.dart';
import 'package:provider/provider.dart' as pro;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: 'basic_channel',
      ),
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        defaultColor: Colors.teal,
        locked: true,
        importance: NotificationImportance.Max,
        soundSource: 'resource://raw/res_custom_notification',
        channelDescription: 'scheduled_channel',
      ),
    ],
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;
  GlobalBloc? globalBloc;

  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    globalBloc = GlobalBloc();
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
          data: (User? data) => ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: false,
            builder: (context, child) {
              return pro.Provider<GlobalBloc>.value(
                value: globalBloc!,
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Beta Health',
                  theme: Pallete.lightModeAppTheme,
                  routeInformationParser: const RoutemasterParser(),
                  routerDelegate: RoutemasterDelegate(
                    routesBuilder: (context) {
                      if (data != null) {
                        getData(ref, data);
                        if (userModel != null) {
                          return loggedInRoute;
                        }
                      }
                      return loggedOutRoute;
                    },
                  ),
                ),
              );
            },
          ),
          error: (Object error, StackTrace stackTrace) =>
              ErrorText(error: error.toString()),
          loading: () => const Center(
            child: SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(),
            ),
          ),
        );
  }
}
