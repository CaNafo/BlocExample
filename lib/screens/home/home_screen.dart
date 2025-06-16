import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_open_api/data/data.dart';
import 'package:task_open_api/screens/home/bloc/home_bloc.dart';
import 'package:task_open_api/screens/home/bloc/home_event.dart';
import 'package:task_open_api/screens/home/bloc/home_state.dart';

import '/core/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: BlocProvider(
        create: (_) => HomeBloc(
          homeRepository: context.read(),
          favoritesRepository: context.read(),
        ),
        child: const _Home(),
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _CocktailTitle(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomSearchField(
            onChanged: (text) {
              context.read<HomeBloc>().add(OnUserSearch(text));
            },
          ),
        ),
        BlocSelector<HomeBloc, HomeState, List<SearchResult>>(
          selector: (state) => state.searchResults,
          builder: (_, results) => Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                var drink = results[index];
                return CocktailPreview(
                  drink: drink,
                  onAddToFavorites: () {
                    context.read<HomeBloc>().add(OnAddToFavorites(drink));
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _CocktailTitle extends StatelessWidget {
  const _CocktailTitle({this.title = 'Explore our cocktails menu!'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
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
