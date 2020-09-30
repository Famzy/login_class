import 'package:login/features/data/datasource/remote/news_data_sourec_impl.dart';
import 'package:login/features/data/models/news_model.dart';
import 'package:login/features/domain/usecases/news_usecase.dart';
import 'package:meta/meta.dart';

import 'base_model.dart';

class NewsViewModel extends BaseModel {
  final NewsUC newsUC;
  List<NewsModel> newsArticles = List<NewsModel>();
  bool isLoading = true;

  NewsViewModel({@required NewsUC remoteNews})
      : assert(remoteNews != null),
        newsUC = remoteNews;

  populateNewsArticles() {
    isLoading = true;
    Webservice().load(NewsModel.all).then((remoteNewsArticles) => {
          newsArticles = remoteNewsArticles,
          notifyListeners(),
          isLoading = false,
        });
  }
}
