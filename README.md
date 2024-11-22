# research_hub

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

Below is a **detailed README.md file** for your project:

---

# Research Hub Mobile App

## Introduction
**Research Hub** is a Flutter mobile application designed to make credible academic research papers accessible to students and the general public. The app leverages the **Scholarpy API** to fetch and display research articles, ensuring a user-friendly interface and smooth navigation between different functionalities. This project was built as part of an individual assignment to demonstrate HTTP requests, state management, and navigation in Flutter.

---

## Features
- **Search Functionality**: Search for research papers based on user queries.
- **Research Paper List**: Displays a list of relevant research papers with titles, authors, and publication details.
- **Detail View**: Provides in-depth information about a selected research paper.
- **User-Friendly UI**: Features animations, a clean layout, and a color scheme that combines white, orange, and black.

---

## Screens Overview
### 1. **Home Screen**
- Purpose: Introduces the app and allows navigation to the search functionality.
- Components:
  - Title and subtitle describing the app's purpose.
  - Animated "Explore Research" button that navigates to the Search Screen.

### 2. **Search Screen**
- Purpose: Allows users to input search queries and view results.
- Components:
  - Input field for user queries.
  - Button to trigger API search requests.
  - List of research papers displayed as interactive cards.
  - Error handling for invalid or empty searches.

### 3. **Detail Screen**
- Purpose: Displays detailed information about a selected research paper.
- Components:
  - Title, authors, and abstract of the research paper.
  - A back button for returning to the Search Screen.

---

## Project Structure
```
lib/
├── main.dart                   // Entry point of the application.
├── screens/
│   ├── home_screen.dart        // Home screen implementation.
│   ├── search_screen.dart      // Search screen implementation.
│   └── detail_screen.dart      // Detail screen implementation.
├── theme/
│   └── colors.dart             // Centralized color definitions.
├── models/
│   └── paper.dart              // Model class for research papers.
├── providers/
│   └── paper_provider.dart     // Manages API calls and app state.
└── widgets/
    └── paper_card.dart         // Custom widget for displaying research paper cards.
```

---

## Technical Details

### API Integration
- **API Used**: [Scholarpy API](https://github.com/AndreaBasile97/Scholarpy)
- **Endpoints**:
  - `/search`: Fetch research papers based on query.
  - `/detail`: Fetch detailed information about a specific paper.
- **HTTP Requests**:
  - **GET** requests for retrieving data.
  - Error handling for invalid queries or failed network requests.

### State Management
- **Provider**: Used to manage state and share data between screens efficiently.

### UI & Animations
- **Color Scheme**:
  - **Primary**: White background.
  - **Secondary**: Orange for buttons and highlights.
  - **Complementary**: Black for text and icons.
- **Animations**:
  - Button scaling animation on the Home Screen for an interactive feel.
  - Smooth transitions between screens.

### Navigation
- **Named Routes**:
  - `/`: Home Screen
  - `/search`: Search Screen
  - `/detail`: Detail Screen

---

## Development Process

1. **API Selection**:
   - Chose the Scholarpy API for its reliable documentation and relevant data for the app's purpose.

2. **Screen Development**:
   - Designed and implemented three distinct screens for searching, displaying, and viewing research papers.

3. **Error Handling**:
   - Handled cases where no results are found, or the network request fails.

4. **State Management**:
   - Used the Provider package to share state across screens efficiently.

5. **UI Enhancements**:
   - Designed a clean layout and added animations to improve user engagement.

6. **Testing**:
   - Tested the app on both emulators and physical devices to ensure functionality and responsiveness.

---

## Challenges and Solutions
- **Challenge**: Parsing complex JSON responses from the API.
  - **Solution**: Used Dart's built-in JSON decoding functions and created a model class for structured data representation.
  
- **Challenge**: Handling empty search results.
  - **Solution**: Added error messages and prompts for valid input.

- **Challenge**: Managing state across screens.
  - **Solution**: Implemented the Provider package to share state and simplify code.

---

## How to Run the Project

1. Clone the repository:
   ```bash
   git clone <repository-link>
   ```
2. Navigate to the project directory:
   ```bash
   cd research_hub
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app on an emulator or physical device:
   ```bash
   flutter run
   ```

---

## Submission Details

- **GitHub Repository**: [Link to the Repository](#)
- **Demo Video**: [Link to the Demo Video](#)


## License
This project is licensed under the MIT License. See the LICENSE file for details.









## Additional

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
