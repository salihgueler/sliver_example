import 'package:flutter/cupertino.dart';
import 'package:sliver_example/model/movie.dart';
import 'package:sliver_example/popular_movies_detail_page.dart';
import 'package:sliver_example/popular_movies_main_page.dart';

void main() => runApp(PopularMoviesApp());

/// Main entry point of the application.
/// Shows a list of movies as Cupertino application
/// Uses fonts and colors for the texts
class PopularMoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings routeSettings) {
        if (routeSettings.name == 'detailPage') {
          Movie movie = routeSettings.arguments;
          return CupertinoPageRoute(builder: (BuildContext context) => (PopularMoviesDetailPage(movie)));
        } else {
          return CupertinoPageRoute(builder: (BuildContext context) => (PopularMoviesMainPage()));
        }
      },
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontFamily: 'Raleway', color: Color(0xFF000000)),
        ),
      ),
    );
  }
}


