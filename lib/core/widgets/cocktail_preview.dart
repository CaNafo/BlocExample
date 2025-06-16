import 'package:flutter/material.dart';

import '/data/data.dart';

class CocktailPreview extends StatelessWidget {
  const CocktailPreview({
    required this.drink,
    required this.onAddToFavorites,
    super.key,
  });

  final SearchResult drink;
  final VoidCallback onAddToFavorites;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cocktail image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              drink.photoUrl ?? "",
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 200,
                child: Center(child: Icon(Icons.broken_image, size: 48)),
              ),
            ),
          ),

          // Cocktail title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              drink.title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          // Action buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Add to Favorites
                ElevatedButton.icon(
                  onPressed: onAddToFavorites,
                  icon: const Icon(Icons.favorite_border),
                  label: const Text('Favorite'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                // View Details
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.local_bar),
                  label: const Text('Details'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
