import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie.dart';

class MoviesWidget extends StatelessWidget {

  final List<Movie> movies;

  MoviesWidget({required this.movies}) ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: movies.length,
      itemBuilder: (context, index){

        final movie = movies[index];

        return ListTile(
          // leading: Image.network(movie.poster),
          
          title: Row(
            children: [
              SizedBox(
                width: 100,
                child: ClipRRect(
                  child: Image.network( movie.poster,
                    errorBuilder:
                        (BuildContext context, Object exception, StackTrace? stackTrace) {
                      // Appropriate logging or analytics, e.g.
                      // myAnalytics.recordError(
                      //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                      //   exception,
                      //   stackTrace,
                      // );
                      return const Text('ð¢');
                    },
                  ),
                  borderRadius: BorderRadius.circular(10),
                )
                
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title),
                      Text(movie.year)
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
