import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/daily_news/domain/entities/article.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_application_1/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }
}

_buildAppbar(BuildContext context) {
  return AppBar(
    title: const Text(
      'Daily News',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () => _onShowSavedArticlesViewTapped(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Icon(Icons.bookmark, color: Colors.black),
        ),
      ),
    ],
  );
}

_buildBody() {
  return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
    if (state is RemoteArticleLoading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (state is RemoteArticlesError) {
      return const Center(
        child: Icon(Icons.refresh),
      );
    }
    if (state is RemoteArticlesDone) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return ArticleWidget(
            article: state.articles![index],
            onArticlePressed: (article) => _onArticlePressed(context,article),
          );
        },
        itemCount: state.articles!.length,
      );
    }
    return const SizedBox();
  });
}

void _onShowSavedArticlesViewTapped(BuildContext context) {
  Navigator.pushNamed(context, '/SavedArticles');
}

void _onArticlePressed(BuildContext context, ArticleEntity article) {
  Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
}
