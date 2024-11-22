import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/paper_provider.dart';
import '../theme/colors.dart';
import '../widgets/paper_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();

  // Animation controller for fade effect
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  bool _isSearching = false; // Track search bar state for animation

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500), // Animation duration
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paperProvider = Provider.of<PaperProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: 'appTitle', // Match tag with HomeScreen for smooth transition
          child: Text('Search Papers'),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300), // Animation duration
            color: _isSearching
                ? AppColors.accent.withOpacity(0.2) // Highlighted color
                : Colors.transparent,
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onTap: () {
                setState(() {
                  _isSearching = true; // Activate animation on tap
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: AppColors.primaryBackground,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              paperProvider.fetchPapers(_controller.text);
              _fadeController.forward(); // Start fade animation
            },
            child: const Text('Search'),
          ),
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnimation, // Apply fade animation
              child: paperProvider.error.isNotEmpty
                  ? Center(
                      child: Text(
                        paperProvider.error,
                        style: const TextStyle(color: AppColors.textPrimary),
                      ),
                    )
                  : ListView.builder(
                      itemCount: paperProvider.papers.length,
                      itemBuilder: (context, index) {
                        return PaperCard(paper: paperProvider.papers[index]);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
