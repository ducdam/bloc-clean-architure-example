import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/theme/app_themes.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_application_1/features/daily_news/presentation/pages/home/daily_home.dart';
import 'package:flutter_application_1/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const DailyNews(),
      ),
    );
  }
}
