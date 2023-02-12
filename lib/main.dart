import 'package:betahealth/core/bloc/global_bloc.dart';
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
