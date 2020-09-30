import 'package:flutter/material.dart';
import 'package:login/core/enums/view_state.dart';
import 'package:login/core/utils/app_constants.dart';
import 'package:login/features/presentation/scoped_models/news_view_model.dart';
import 'package:login/features/presentation/widgets/busy_overlay.dart';

import 'base_view.dart';

class NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
  }

  ListTile _buildItemsForListView(
      BuildContext context, int index, NewsViewModel model) {
    return ListTile(
      title: model.newsArticles[index].urlToImage == null
          ? Image.asset(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL)
          : Image.network(model.newsArticles[index].urlToImage),
      subtitle:
          Text(model.newsArticles[index].title, style: TextStyle(fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsViewModel>(
      onModelReady: (model) => model.populateNewsArticles(),
      builder: (context, child, model) => BusyOverlay(
        show: model.state == ViewState.Busy,
        child: Scaffold(
          appBar: AppBar(
            title: Text('News'),
          ),
          body: Center(
            child: model.isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: model.newsArticles.length,
                    itemBuilder: (context, itemIndex) {
                      return _buildItemsForListView(context, itemIndex, model);
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

class NewsList extends StatefulWidget {
  @override
  createState() => NewsListState();
}
