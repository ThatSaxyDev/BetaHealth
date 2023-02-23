import 'dart:developer';

import 'package:betahealth/core/failure.dart';
import 'package:betahealth/features/insights/repos/insights_repo.dart';
import 'package:betahealth/models/news_model.dart';
import 'package:betahealth/models/video_model.dart';
import 'package:betahealth/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final insightsControllerProvider =
    StateNotifierProvider<InsightsController, bool>((ref) => InsightsController(
        insightsRepo: ref.watch(insightsRepoProvider), ref: ref));

// get videos provider
final getVideosProvider = StreamProvider(
    (ref) => ref.read(insightsControllerProvider.notifier).getVideos());

class InsightsController extends StateNotifier<bool> {
  final InsightsRepo _insightsRepo;
  final Ref _ref;
  InsightsController({
    required InsightsRepo insightsRepo,
    required Ref ref,
  })  : _insightsRepo = insightsRepo,
        _ref = ref,
        super(false);

  // get videos
  Stream<List<VideoModel>> getVideos() {
    return _insightsRepo.getVideos();
  }
}
