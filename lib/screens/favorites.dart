import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';

class FavoritesPage extends StatefulWidget {
  final List<Movie> favoriteMovies;
  final Function(Movie) onRemoveFavorite;

  const FavoritesPage({
    super.key,
    required this.favoriteMovies,
    required this.onRemoveFavorite,
  });

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<Movie> currentFavorites;

  @override
  void initState() {
    super.initState();
    currentFavorites = List.from(widget.favoriteMovies);
  }

  void removeMovie(Movie movie) {
    setState(() {
      currentFavorites.remove(movie);
      widget.onRemoveFavorite(movie);
    });

    // Show the SnackBar after the movie is removed
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('${movie.title} was successfully removed from favorites.'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating, // Make it float
        margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20), // Position it away from the screen edges
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: currentFavorites.isEmpty
          ? const Center(
              child: Text(
                'No favorite movies added yet.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: currentFavorites.length,
              itemBuilder: (context, index) {
                final movie = currentFavorites[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(movie.title),
                    subtitle: Text(
                      movie.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeMovie(movie),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
