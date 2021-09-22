import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/widgets/movies_widget.dart';
import 'package:http/http.dart' as http;

import 'models/movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Movie> _movies = [];

  @override
  void initState(){
    super.initState();

    _popularteAllMovies();
  }

  void _popularteAllMovies() async{
    final movies = await _fetchAllMovies();
    setState(() {
      _movies = movies;
    });
  }

  Future<List<Movie>> _fetchAllMovies() async{
    final response = await http.get(Uri.parse("http://www.omdbapi.com/?s=Batman&page=1&apikey=3f298f34"));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);

      Iterable list = result["Search"];

      return list.map((movie) => Movie.fromJson(movie)).toList();

    }else{
      throw Exception("Failed to load movies!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', movies: _movies,),


    );
  }
}



class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title, required List<List<Movie>> movies}) : super(key: key);

  final String title;
  final List<Movie> movies;

  MyHomePage({Key? key, required this.title, required this.movies}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        body: MoviesWidget(movies: widget.movies)
    );
  }
}
