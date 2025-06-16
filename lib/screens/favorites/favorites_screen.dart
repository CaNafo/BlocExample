import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_open_api/core/core.dart';
import 'package:task_open_api/screens/favorites/bloc/favorites_bloc.dart';
import 'package:task_open_api/screens/favorites/bloc/favorites_event.dart';
import 'package:task_open_api/screens/favorites/bloc/favorites_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  static const String routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: BlocProvider(
        create: (_) => FavoritesBloc(favoritesRepository: context.read()),
        child: const _Favorites(),
      ),
    );
  }
}

class _Favorites extends StatelessWidget {
  const _Favorites();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        var favoriteCocktails = context
            .read<FavoritesBloc>()
            .getFavoritesCocktails();
        if (favoriteCocktails.isEmpty) {
          return const Center(
            child: Text(
              'No favorites yet 🍸',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            itemCount: favoriteCocktails.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const _FavoritesTitle();
              }
              final cocktail = favoriteCocktails[index - 1];
              return CocktailPreview(
                isFavorite: true,
                onAddToFavorites: () {
                  context.read<FavoritesBloc>().add(
                    OnRemoveFromFavorites(cocktail),
                  );
                },
                drink: cocktail,
              );
            },
          ),
        );
      },
    );
  }
}

class _FavoritesTitle extends StatelessWidget {
  const _FavoritesTitle({this.title = 'Your Favorite Cocktails'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
