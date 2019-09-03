
import 'cinema.dart';

class Movie {
  String title;
  String duration;
  double rate;
  int position;
  String releaseDate;
  String shortInfo;
  String plot;
  String posterPath;
  String backgroundColor;
  String backdropImage;
  List<Cinema> cinemas;

  Movie(this.title, this.duration, this.rate, this. position, this.releaseDate, this.shortInfo,
      this.plot, this.posterPath, this.backgroundColor, this.backdropImage, this.cinemas);
  Movie.fromJson(Map<String, dynamic> moviesJson) {
    Movie(
        title = moviesJson['title'],
        duration = moviesJson['duration'],
        rate = moviesJson['rate'],
        position = moviesJson['position'],
        releaseDate = moviesJson['release-date'],
        shortInfo = moviesJson['short-info'],
        plot = moviesJson['plot'],
        posterPath = moviesJson['poster_path'],
        backgroundColor = moviesJson['backgroundColor'],
        backdropImage = moviesJson['backdrop_image'],
        cinemas = _getCinemas(moviesJson['cinemas']));
  }

  List<Cinema> _getCinemas(List<dynamic> moviesJson) {
    List<Cinema> savedCinemas = [];
    
    moviesJson.forEach((cinema){
      Cinema cinemaItem = Cinema.fromJson(cinema);
      savedCinemas.add(cinemaItem);
    });
    return savedCinemas;
  }
}
