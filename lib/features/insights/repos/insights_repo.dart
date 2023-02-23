import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:betahealth/core/constants/constants.dart';
import 'package:betahealth/core/failure.dart';
import 'package:betahealth/core/type_defs.dart';
import 'package:betahealth/models/news_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

final articlesDataProvider = FutureProvider<List<NewsModel>>((ref) async {
  return ref.read(insightsRepoProvider).getNewsInsights();
});

final Provider<InsightsRepo> insightsRepoProvider =
    Provider((ref) => InsightsRepo());

class InsightsRepo {
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

  // FutureEither<List<NewsModel>> getNewsInsights() async {
  //   try {
  //     // make request
  //     http.Request request = http.Request("GET", Uri.parse(Constants.newsUrl))
  //       ..headers.addAll({"Content-Type": "application/json; charset=UTF-8"});

  //     http.StreamedResponse response = await request.send();

  //     String responseStream = await response.stream.bytesToString();

  //     Map<String, dynamic> responseInMap = jsonDecode(responseStream);

  //     if (responseInMap['status'] == 'ok') {
  //       //! hold the data temporarily
  //       final List tempNewsList = responseInMap["articles"];

  //       //! create the empty news list
  //       final List<NewsModel> theNewsList = [];

  //       // add the data to the list
  //       for (var element in tempNewsList) {
  //         theNewsList.add(NewsModel.fromJson(element));
  //       }

  //       log(theNewsList.length.toString());

  //       return right(theNewsList);
  //     } else {
  //       String error = responseInMap['status'];
  //       return left(Failure(error));
  //     }
  //   } catch (e) {
  //     return left(Failure(e.toString()));
  //   }
  // }
}
