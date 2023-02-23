// import 'dart:developer';

// import 'package:betahealth/core/failure.dart';
// import 'package:betahealth/features/insights/repos/insights_repo.dart';
// import 'package:betahealth/models/news_model.dart';
// import 'package:betahealth/utils/snack_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fpdart/fpdart.dart';

// final StateNotifierProvider<InsightsController, bool>
//     insightsControllerProvider =
//     StateNotifierProvider<InsightsController, bool>((ref) => InsightsController(
//         insightsRepo: ref.watch(insightsRepoProvider), ref: ref));

// class InsightsController extends StateNotifier<bool> {
//   final InsightsRepo _insightsRepo;
//   // final Ref _ref;
//   InsightsController({
//     required InsightsRepo insightsRepo,
//     required Ref ref,
//   })  : _insightsRepo = insightsRepo,
//         // _ref = ref,
//         super(false);

//   // get list of news from newsapi.org
//   Future<bool> getNewsInsights({required BuildContext context}) async {
//     state = true;
//     Either<Failure, List<NewsModel>> response =
//         await _insightsRepo.getNewsInsights().catchError((error) {
//       state = false;
//       log("Error encountered: $error");
//     });

//     state = false;

//     response.fold(
//         (Failure failure) => showSnackBar(
//               context,
//               failure.message,
//             ),
//         (List<NewsModel> successStatement) => []);

//     return response.isRight();
//   }
// }
