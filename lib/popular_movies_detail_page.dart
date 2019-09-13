import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_example/model/cinema.dart';
import 'package:sliver_example/model/movie.dart';
import 'package:sliver_example/popular_movies_main_page.dart';
import 'package:sliver_example/widget/star_rating.dart';

class PopularMoviesDetailPage extends StatefulWidget {
  final Movie movie;
  PopularMoviesDetailPage(this.movie);

  @override
  _PopularMoviesDetailPageState createState() =>
      _PopularMoviesDetailPageState();
}

class _PopularMoviesDetailPageState extends State<PopularMoviesDetailPage>
    with SingleTickerProviderStateMixin {
  int currentValue = 0;
  Widget currentTab;

  AnimationController _animationController;
  Animation<Offset> _movieInformationSlidingAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();
    _movieInformationSlidingAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
            CurvedAnimation(
                curve: Interval(0.25, 1.0, curve: Curves.fastOutSlowIn),
                parent: _animationController));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 2
        body: CustomScrollView(
          slivers: <Widget>[
            // 3
            SliverAppBar(
              expandedHeight: 200.0,
              backgroundColor: getColorFromHex(widget.movie.backgroundColor),
              // 4
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.movie.title),
                background: Image.asset(
                  widget.movie.backdropImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _createCinemaList(List<Cinema> cinemas) {
    List<Widget> cinemaWidgetList = [];

    cinemas.forEach((cinema) {
      cinemaWidgetList.add(Container(
        padding: EdgeInsets.only(left: 16, top: 16, right: 16),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.payment,
              size: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(cinema.theaterName),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Text(cinema.theaterPhone),
                ),
                CupertinoButton(
                  child: Text(
                    'Add to the favourites',
                    style: TextStyle(
                        color: CupertinoTheme.of(context).primaryColor),
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ));
    });
    return cinemaWidgetList;
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
