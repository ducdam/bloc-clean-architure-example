import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/daily_news/domain/entities/article.dart';

abstract class LocalArticlesState extends Equatable {
  final List<ArticleEntity> ? articles;
  const LocalArticlesState({this.articles});

  @override
  List<Object> get props => [articles!];
}

class LocalArticleLoading extends LocalArticlesState {
  const LocalArticleLoading();
}

class LocalArticlesDone extends LocalArticlesState{
  const LocalArticlesDone(List<ArticleEntity> articles) : super(articles: articles);
}

