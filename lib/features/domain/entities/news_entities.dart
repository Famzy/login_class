import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String title;
  final String descrption;
  final String urlToImage;

  NewsEntity({this.title, this.descrption, this.urlToImage})
      : super([title, descrption, urlToImage]);
}
