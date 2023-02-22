import 'dart:convert';
import 'dart:developer';

import 'package:betahealth/core/constants/constants.dart';
import 'package:betahealth/core/failure.dart';
import 'package:betahealth/core/type_defs.dart';
import 'package:betahealth/models/news_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class InsightsRepo {
  // get list of news from newsapi.org
  FutureEither<List<NewsModel>> getNewsInsights() async {
    try {
      // make request
      http.Request request = http.Request("GET", Uri.parse(Constants.newsUrl))
        ..headers.addAll({"Content-Type": "application/json; charset=UTF-8"});

      http.StreamedResponse response = await request.send();

      String responseStream = await response.stream.bytesToString();

      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      if (responseInMap['status'] == 'ok') {
        //! hold the data temporarily
        final List tempNewsList = responseInMap["articles"];

        //! create the empty news list
        final List<NewsModel> theNewsList = [];

        // add the data to the list
        for (var element in tempNewsList) {
          theNewsList.add(NewsModel.fromJson(element));
        }

        log(theNewsList.length.toString());

        return right(theNewsList);
      } else {
        String error = responseInMap['status'];
        return left(Failure(error));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
