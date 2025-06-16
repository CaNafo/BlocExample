class SearchResult {
  const SearchResult({
    required this.cocktailId,
    required this.title,
    required this.photoUrl,
  });

  final String cocktailId;
  final String title;
  final String? photoUrl;


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SearchResult && other.cocktailId == cocktailId;
  }

  @override
  int get hashCode => cocktailId.hashCode;
}
