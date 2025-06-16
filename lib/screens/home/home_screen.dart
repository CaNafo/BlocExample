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
        create: (_) => HomeBloc(homeRepository: context.read()),
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
        Text("TEST"),
        CustomSearchField(
          onChanged: (text) {
            context.read<HomeBloc>().add(OnUserSearch(text));
          },
        ),
        BlocSelector<HomeBloc, HomeState, List<SearchResult>>(
          selector: (state) => state.searchResults,
          builder: (_, results) => Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                var drink = results[index];
                return Column(
                  children: [
                    Text("${drink.title}"),
                    if (drink.photoUrl != null) Image.network(drink.photoUrl!),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
