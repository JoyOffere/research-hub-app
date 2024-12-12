# Flutter Movie App 🎬

## Overview

This Flutter mobile application provides an interactive movie browsing experience by integrating with the TMDB (The Movie Database) API. Users can explore popular, top-rated, and upcoming movies, and manage a personal list of favorite films.

## Features

### Screens
- **Index Page**: Landing screen with a welcome background and navigation to the home page
- **Home Page**: 
  - Browse movies in three categories:
    - Popular Movies
    - Top Rated Movies
    - Upcoming Movies
  - Interactive favorite button for each movie
- **Favorites Page**: 
  - View and manage your favorite movies
  - Remove movies from favorites list

### Key Functionalities
- Seamless API integration with TMDB
- Dynamic movie data fetching
- Responsive UI design
- Favorite movies management
- Error handling for API requests

## Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- TMDB API Key

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/flutter-movie-app.git
   cd flutter-movie-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure TMDB API Key:
   - Create a `.env` file in the project root
   - Add your TMDB API key:
     ```
     TMDB_API_KEY=your_api_key_here
     ```

4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
├── lib/
│   ├── main.dart
│   ├── models/
│   │   └── movie.dart
│   ├── screens/
│   │   ├── index_page.dart
│   │   ├── home_page.dart
│   │   └── favorites_page.dart
│   └── services/
│       └── movie_service.dart
└── pubspec.yaml
```

## Technologies Used

- **Framework**: Flutter
- **State Management**: setState (with potential for future Provider/BLoC implementation)
- **HTTP Requests**: http package
- **API**: TMDB API

## API Integration

The app uses the following TMDB API endpoints:
- Get Popular Movies
- Get Top Rated Movies
- Get Upcoming Movies

## Challenges and Solutions

1. **API Key Management**: Secured using environment variables
2. **Error Handling**: Implemented user-friendly error messages
3. **UI Responsiveness**: Used Flutter's responsive design widgets
4. **State Persistence**: Prepared for future SharedPreferences integration

## Future Enhancements

- [ ] Advanced state management (Provider/BLoC)
- [ ] Movie search functionality
- [ ] Persistent favorites storage
- [ ] Detailed movie information screen

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Joy Offere - j.offere@alustudent.com
