import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/my_app.dart';
import '../widgets/empty_card.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimaryContainer,
    );

    if (appState.favorites.isEmpty) {
      return Center(
        child: EmptyCard(
          message: "No favorites yet.",
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            for (var favorite in appState.favorites)
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  size: style.fontSize,
                ),
                title: Text(
                  favorite.asPascalCase,
                  style: style,
                  semanticsLabel: "${favorite.first} ${favorite.second}",
                ),
                onTap: () {
                  appState.removeFavorite(favorite);
                },
              ),
          ],
        ),
      ),
    );
  }
}
