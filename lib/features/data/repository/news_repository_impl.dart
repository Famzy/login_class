import 'package:login/core/network/network_info.dart';
import 'package:login/features/data/datasource/local/local_storage_services.dart';
import 'package:login/features/data/datasource/remote/new_data_source.dart';
import 'package:login/features/domain/entities/news_entities.dart';
import 'package:login/features/domain/repository/news_repository.dart';
import 'package:meta/meta.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource dataSource;
  final NetworkInfo networkInfo;
  final LocalStorageServices localStorageServices;

  NewsRepositoryImpl(
      {@required this.dataSource,
      @required this.networkInfo,
      @required this.localStorageServices});

  @override
  Future<NewsEntity> requestNews() async {
    if (await networkInfo.isConnected) {
      try {
        final news = await dataSource.news();
        return news;
      } catch (e) {
        print(e);
      }
    } else {
      final news = await localStorageServices.db;
    }
  }
}
