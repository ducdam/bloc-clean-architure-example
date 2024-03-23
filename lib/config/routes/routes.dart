import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/daily_news/domain/entities/article.dart';
import 'package:flutter_application_1/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:flutter_application_1/features/daily_news/presentation/pages/home/daily_home.dart';
import 'package:flutter_application_1/features/daily_news/presentation/pages/saved_article/saved_article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      case '/ArticleDetails':
        return _materialRoute(
            ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticlesView());

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
