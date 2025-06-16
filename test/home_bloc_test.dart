import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_open_api/data/data.dart';
import 'package:task_open_api/models/models.dart';

import 'package:task_open_api/screens/home/bloc/home_bloc.dart';
import 'package:task_open_api/screens/home/bloc/home_event.dart';
import 'package:task_open_api/screens/home/bloc/home_state.dart';

// --- Mock classes ---
class MockHomeRepository extends Mock implements HomeRepository {}

class MockFavoritesRepository extends Mock implements FavoritesRepository {}

class FakeSearchResult extends Fake implements SearchResult {}

void main() {
  late MockHomeRepository mockHomeRepository;
  late MockFavoritesRepository mockFavoritesRepository;

  setUpAll(() {
    registerFallbackValue(FakeSearchResult());
    mockHomeRepository = MockHomeRepository();
    mockFavoritesRepository = MockFavoritesRepository();
  });

  group('HomeBloc', () {
    blocTest<HomeBloc, HomeState>(
      'emits updated state with search results on successful OnUserSearch',
      build: () {
        when(
          () => mockHomeRepository.fetchCocktails(query: 'margarita'),
        ).thenAnswer(
          (_) async => const Success([
            SearchResult(cocktailId: '1', title: 'Margarita', photoUrl: null),
          ]),
        );
        return HomeBloc(
          homeRepository: mockHomeRepository,
          favoritesRepository: mockFavoritesRepository,
        );
      },
      act: (bloc) => bloc.add(const OnUserSearch('margarita')),
      wait: const Duration(milliseconds: 250), // due to debounce
      expect: () => [
        isA<HomeState>().having(
          (s) => s.searchResults.length,
          'drinks found',
          1,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits state with empty list on search failure',
      build: () {
        when(
          () => mockHomeRepository.fetchCocktails(query: 'xyz'),
        ).thenAnswer((_) async => Failure(Exception("Not found")));
        return HomeBloc(
          homeRepository: mockHomeRepository,
          favoritesRepository: mockFavoritesRepository,
        );
      },
      act: (bloc) => bloc.add(OnUserSearch('xyz')),
      wait: const Duration(milliseconds: 250),
      expect: () => [
        isA<HomeState>().having(
          (s) => s.searchResults.isEmpty,
          'empty result',
          true,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'adds cocktail to favorites and emits updated count',
      build: () {
        when(() => mockFavoritesRepository.savedCocktails).thenReturn([
          const SearchResult(cocktailId: '1', title: 'Negroni', photoUrl: null),
        ]);
        when(
          () => mockFavoritesRepository.addCocktailToFavorites(any()),
        ).thenAnswer((_) {});
        return HomeBloc(
          homeRepository: mockHomeRepository,
          favoritesRepository: mockFavoritesRepository,
        );
      },
      act: (bloc) => bloc.add(
        const OnAddToFavorites(
          SearchResult(cocktailId: '1', title: 'Negroni', photoUrl: null),
        ),
      ),
      expect: () => [
        isA<HomeState>().having((s) => s.favoritesCount, 'favorites count', 1),
      ],
    );
  });
}
