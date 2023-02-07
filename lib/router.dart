import 'package:betahealth/features/auth/views/auth_view.dart';
import 'package:betahealth/features/auth/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute =
    RouteMap(routes: {'/': (_) => const MaterialPage(child: AuthView())});

final loggedInRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: HomeView(),
        ),
  },
);
