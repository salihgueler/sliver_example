import 'package:flutter/cupertino.dart';
import 'package:sliver_example/model/movie.dart';
import 'package:sliver_example/widget/floating_card.dart';
import 'package:sliver_example/widget/star_rating.dart';

class MovieItemCard extends StatelessWidget {
  const MovieItemCard(
      {Key key,
      @required this.cardSize,
      @required this.movie,
      @required this.index})
      : super(key: key);

  final double cardSize;
  final int index;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return FloatingCard(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Hero(
              tag: movie.title,
              child: Image.asset(
                movie.posterPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            top: cardSize - 176,
            child: Container(
              color: Color(0xEEFFFFFF),
            ),
          ),
          Positioned(
            left: 24,
            bottom: 92,
            child: Text(
              movie.title,
            ),
          ),
          Positioned(
            left: 24,
            bottom: 56,
            child: Text(
              movie.releaseDate,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Positioned(
              left: 24,
              bottom: 24,
              child:
              StarRating(
                rating: movie.rate.toDouble(),
                color: Color(0xFFF6C32C),
              )),
        ],
      ),
    );
  }
}
