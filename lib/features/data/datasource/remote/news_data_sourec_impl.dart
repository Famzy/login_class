import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:login/features/data/models/news_model.dart';
import 'package:http/http.dart' show Client;

import 'new_data_source.dart';

class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({this.url, this.parse});
}

class Webservice {
  Future<T> load<T>(Resource<T> resource) async {
    final response = await http.get(resource.url);
    if (response.statusCode == HttpStatus.ok) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

class NewsDataSourceImpl implements NewsDataSource {
  http.Client client = Client();

  NewsDataSourceImpl({this.client});

  @override
  Future<NewsModel> news() {
    final response = Webservice().load(NewsModel.all);
  }
}
