import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_application_1/features/daily_news/data/local/DAO/article_dao.dart';
import 'package:flutter_application_1/features/daily_news/data/models/article.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
}
