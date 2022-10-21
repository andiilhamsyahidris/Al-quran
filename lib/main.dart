import 'package:alquran/common/constant.dart';
import 'package:alquran/common/utils.dart';
import 'package:alquran/presentation/bloc/detail_surah_bloc/detail_surah_bloc.dart';
import 'package:alquran/presentation/bloc/surah_list_bloc/surah_list_bloc.dart';
import 'package:alquran/presentation/pages/home_surah_page.dart';
import 'package:alquran/presentation/pages/surah_page.dart';
import 'package:flutter/material.dart';
import 'package:alquran/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<SurahListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailSurahBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(colorScheme: kColorScheme),
        home: HomeSurahPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeSurahPage());
            case SurahPage.route_name:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => SurahPage(id: id), settings: settings);
          }
        },
      ),
    );
  }
}
