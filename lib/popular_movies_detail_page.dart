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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: getColorFromHex(widget.movie.backgroundColor),
        middle: Text(widget.movie.title),
      ),
      child: AnimatedBuilder(
        animation: _animationController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CupertinoSegmentedControl(
              groupValue: currentValue,
              children: const <int, Widget>{
                0: Text('Storyline'),
                1: Text('Tickets'),
              },
              onValueChanged: (value) {
                if (value == 0) {
                  currentTab = Padding(
                    padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: Text(widget.movie.plot),
                  );
                } else {
                  currentTab = Padding(
                    padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: Column(
                      children: _createCinemaList(widget.movie.cinemas),
                    ),
                  );
                }
                setState(() {
                  currentValue = value;
                });
              },
            ),
            currentTab ??
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: Text(widget.movie.plot),
                )
          ],
        ),
        builder: (context, child) {
          return ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Hero(
                      tag: widget.movie.title,
                      child: Image.asset(
                        widget.movie.posterPath,
                        height: 200,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.movie.title),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StarRating(
                            rating: widget.movie.rate.toDouble(),
                            color: Color(0xFFF6C32C),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.date_range),
                              ),
                              Text(widget.movie.releaseDate)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.timer),
                              ),
                              Text(widget.movie.duration.toString())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Opacity(
                opacity: _animationController.value,
                child: FractionalTranslation(
                  translation: _movieInformationSlidingAnimation.value,
                  child: child,
                ),
              )
            ],
          );
        },
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
