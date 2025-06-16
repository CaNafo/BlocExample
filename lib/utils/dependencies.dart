import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '/data/data.dart';

/// Configure dependencies fore services.
List<SingleChildWidget> get injectServiceDependencies {
  return [RepositoryProvider(create: (_) => ApiService())];
}

/// Configure dependencies for repositories.
List<SingleChildWidget> get injectRepositoryDependencies {
  return [
    RepositoryProvider(create: (ctx) => HomeRepository(apiService: ctx.read()),),
    RepositoryProvider(create: (ctx) => FavoritesRepository(),),
  ];
}
