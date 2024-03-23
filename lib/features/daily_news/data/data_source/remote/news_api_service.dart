
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constants/constants.dart';
import 'package:flutter_application_1/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewApiService {
  factory NewApiService(Dio dio) = _NewApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
  });
}
