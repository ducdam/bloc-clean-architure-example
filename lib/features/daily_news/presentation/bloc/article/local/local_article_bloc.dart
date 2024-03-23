import 'package:flutter_application_1/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:flutter_application_1/features/daily_news/domain/usecases/remove_article.dart';
import 'package:flutter_application_1/features/daily_news/domain/usecases/save_article.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticleLoading()){
    on<GetSavedArticles> (onGetSavedArticles);
    on<RemoveArticle> (onRemoveArticle);
    on<SaveArticle> (onSaveArticle);
  }

  void onGetSavedArticles(GetSavedArticles event,Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(RemoveArticle removeArticles, Emitter<LocalArticlesState> emit) async {
    await _removeArticleUseCase(params: removeArticles.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(SaveArticle saveArticles, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUseCase(params: saveArticles.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
