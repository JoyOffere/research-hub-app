class Paper {
  final String title;
  final String author;
  final String abstractText;
  final String link;

  Paper({
    required this.title,
    required this.author,
    required this.abstractText,
    required this.link,
  });

  factory Paper.fromJson(Map<String, dynamic> json) {
    return Paper(
      title: json['title'] ?? 'No Title Available',
      author: json['author'] ?? 'Unknown Author',
      abstractText: json['abstract'] ?? 'Abstract not provided',
      link: json['link'] ?? '',
    );
  }
}
