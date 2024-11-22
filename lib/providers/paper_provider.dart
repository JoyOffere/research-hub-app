import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/paper.dart';

class PaperProvider with ChangeNotifier {
  List<Paper> _papers = [];
  String _error = '';

  List<Paper> get papers => _papers;
  String get error => _error;

  Future<void> fetchPapers(String query) async {
    final url = 'https://api.example.com/search?query=$query';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
        _papers = data.map((item) => Paper.fromJson(item)).toList();
      } else {
        _error = 'Error: Unable to fetch data';
      }
    } catch (e) {
      _error = 'Error: $e';
    }
    notifyListeners();
  }
}
