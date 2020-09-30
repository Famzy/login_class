import 'dart:convert';

import 'package:login/core/utils/app_constants.dart';
import 'package:login/features/data/datasource/remote/news_data_sourec_impl.dart';
import 'package:login/features/domain/entities/news_entities.dart';
import 'package:meta/meta.dart';

class NewsModel extends NewsEntity {
  NewsModel(
      {@required String title,
      @required String descrption,
      @required String urlToImage})
      : super(urlToImage: urlToImage, title: title, descrption: descrption);

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        title: json['title'],
        descrption: json['description'],
        urlToImage:
            json['urlToImage'] ?? Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> news = new Map<String, dynamic>();
    news['title'] = title;
    news['description'] = descrption;
    news['urlToImage'] = urlToImage;
  }

  static Resource<List<NewsModel>> get all {
    return Resource(
        url: Constants.BASE_URL,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['articles'];
          return list.map((model) => NewsModel.fromJson(model)).toList();
        });
  }
}
