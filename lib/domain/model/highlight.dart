class Highlight {
  Highlight({
    required this.date,
    required this.title,
    required this.text,
    required this.wikiLink,
    required this.pressLink,
    required this.redditLink,
  });

  final DateTime date;
  final String title;
  final String text;
  final String? wikiLink;
  final String? pressLink;
  final String? redditLink;
}
