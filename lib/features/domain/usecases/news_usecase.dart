import 'package:login/core/usecase/usecase.dart';
import 'package:login/features/domain/repository/news_repository.dart';

class NewsUC implements UseCase {
  @override
  final NewsRepository repository;

  NewsUC(this.repository);

  Future call(Params) async {
    return await repository.requestNews();
  }
}
