import 'package:login/domain/services/web_services.dart';
import 'package:login/models/news_model.dart';

import 'base_model.dart';

class NewsViewModel extends BaseModel {
  List<NewsArticle> newsArticles = List<NewsArticle>();
  bool isLoading = true;

  populateNewsArticles() {
    isLoading = true;
    Webservice().load(NewsArticle.all).then((remoteNewsArticles) => {
          newsArticles = remoteNewsArticles,
          notifyListeners(),
          isLoading = false,
        });
  }
}
