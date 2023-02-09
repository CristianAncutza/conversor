import 'package:flutter/material.dart';
import '../models/new_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'a03301418d1741d9bcbc1cf80092cf3a';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadLines();
  }

  getTopHeadLines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=ar';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
  }
}
