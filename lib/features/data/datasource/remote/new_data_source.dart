import 'package:login/features/data/models/news_model.dart';

abstract class NewsDataSource {
  Future<NewsModel> news();
}
