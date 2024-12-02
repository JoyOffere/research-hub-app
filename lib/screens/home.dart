import 'package:flutter/material.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/model/movie_model.dart';
import 'favorites.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topRatedMovies;

  List<Movie> favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    upcomingMovies = Api().getUpcomingMovies();
    popularMovies = Api().getPopularMovies();
    topRatedMovies = Api().getTopRatedMovies();
  }

  void toggleFavorite(Movie movie) {
    setState(() {
      if (favoriteMovies.contains(movie)) {
        favoriteMovies.remove(movie);
      } else {
        favoriteMovies.add(movie);
      }
    });
  }

  void removeFavorite(Movie movie) {
    setState(() {
      favoriteMovies.remove(movie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
        title: const Text("Movies App"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesPage(
                favoriteMovies: favoriteMovies,
                onRemoveFavorite: removeFavorite,
              ),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Popular Movies',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            _buildMovieSection(popularMovies),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Top Rated Movies',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            _buildMovieSection(topRatedMovies),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Upcoming Movies',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            _buildMovieSection(upcomingMovies),

          ],
        ),
      ),
    );
  }

  Widget _buildMovieSection(Future<List<Movie>> moviesFuture) {
    return FutureBuilder<List<Movie>>(
      future: moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No movies available.'));
        } else {
          final List<Movie> movies = snapshot.data!;
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final Movie movie = movies[index];
                return Stack(
                  children: [
                    Container(
                      width: 130,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 25,
                      child: GestureDetector(
                        onTap: () => toggleFavorite(movie),
                        child: Icon(
                          favoriteMovies.contains(movie)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favoriteMovies.contains(movie)
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
