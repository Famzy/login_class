import 'package:login/features/domain/entities/news_entities.dart';

abstract class NewsRepository {
  Future<NewsEntity> requestNews();
}
