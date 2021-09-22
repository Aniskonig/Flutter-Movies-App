class Movie {

  final String imdId;
  final String poster;
  final String title;
  final String year;

  Movie(this.imdId, this.poster, this.title, this.year);

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie (
        json["imdbID"],
        json["Poster"],
        json["Title"],
        json["Year"]
    );
  }
}