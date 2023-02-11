import 'package:betahealth/features/auth/views/auth_view.dart';
import 'package:betahealth/features/profile/views/profile_view.dart';
import 'package:betahealth/features/base_nav_wrapper/views/base_nav_wrapper.dart';
import 'package:betahealth/features/notes/views/add_notes_view.dart';
import 'package:betahealth/features/notes/views/read_notes_view.dart';
import 'package:betahealth/features/onboarding/view/onboarding_view.dart';
import 'package:betahealth/features/splash/view/splash_view.dart';
import 'package:betahealth/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: OnboardingView(),
        ),
  },
);

final loggedInRoute = RouteMap(
  routes: {
    // '/': (_) => const MaterialPage(
    //       child: HomeView(),
    //     ),
    // '/': (_) => const MaterialPage(
    //       child: SplashView(),
    //     ),
    // '/': (_) => const MaterialPage(
    //       child: OnboardingView(),
    //     ),
    '/': (_) => const MaterialPage(
          child: BaseNavWrapper(),
        ),
    '/add-notes': (_) => const MaterialPage(
          child: AddNotesView(),
        ),
  },
);
