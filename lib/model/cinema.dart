class Cinema {
  String theaterName;
  String theaterPhone;

  Cinema(this.theaterName, this.theaterPhone);
  Cinema.fromJson(Map<String, dynamic> moviesJson) {
    Cinema(theaterName = moviesJson['theaterName'],
        theaterPhone = moviesJson['theaterPhone']);
  }
}
