import "package:movie_app/api/constants.dart";
import "package:movie_app/model/movie_model.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  final upComingApiUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey";
  final popularApiUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apikey";
  final topRatedApiUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey";

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upComingApiUrl));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((movie) => Movie.fromMap(movie)).toList();
    } else {
      throw Exception("Failed to load upcoming movies");
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularApiUrl));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((movie) => Movie.fromMap(movie)).toList();
    } else {
      throw Exception("Failed to load popular movies");
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedApiUrl));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((movie) => Movie.fromMap(movie)).toList();
    } else {
      throw Exception("Failed to load top-rated movies");
    }
  }
}
