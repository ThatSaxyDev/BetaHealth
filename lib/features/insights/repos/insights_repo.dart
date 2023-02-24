import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:betahealth/core/constants/constants.dart';
import 'package:betahealth/core/constants/firebase_constants.dart';
import 'package:betahealth/core/failure.dart';
import 'package:betahealth/core/providers/firebase_provider.dart';
import 'package:betahealth/core/type_defs.dart';
import 'package:betahealth/models/news_model.dart';
import 'package:betahealth/models/video_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

final articlesDataProvider = FutureProvider<List<NewsModel>>((ref) async {
  return ref.read(insightsRepoProvider).getNewsInsights();
});

final Provider<InsightsRepo> insightsRepoProvider =
    Provider((ref) => InsightsRepo(firestore: ref.watch(firestoreProvider)));

class InsightsRepo {
  final FirebaseFirestore _firestore;
  InsightsRepo({required FirebaseFirestore firestore}) : _firestore = firestore;

  // get list of news from newsapi.org
  Future<List<NewsModel>> getNewsInsights() async {
    try {
      http.Response response = await http.get(Uri.parse(Constants.newsUrl));
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['articles'];
        // log(result.toString());
        return result
            .map((article) => NewsModel(
                  article['author'],
                  article['title'],
                  article['description'],
                  article['url'],
                  article['urlToImage'],
                  DateTime.parse(article['publishedAt']),
                ))
            .toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (errs) {
      log(errs.toString());
      throw Exception('No  internet connection');
    }
  }

  // get videos
  Stream<List<VideoModel>> getVideos() {
    return _videos.snapshots().map((event) => event.docs
        .map((e) => VideoModel.fromMap(e.data() as Map<String, dynamic>))
        .toList());
  }

  CollectionReference get _videos =>
      _firestore.collection(FirebaseConstants.videosCollection);
}
