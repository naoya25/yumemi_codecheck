import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yumemi_codecheck/constants/routes.dart';

import '../../view_models/favorite_view_model.dart';
import 'components/favorite_repository_card.dart';
import 'components/theme_toggle_button.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = context.watch<FavoriteViewModel>();

    useEffect(() {
      favoriteViewModel.loadFavorites();
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yumemi CodeCheck'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          const ThemeToggleButton(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.push(Routes.search);
            },
          ),
        ],
      ),
      body: favoriteViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : favoriteViewModel.hasFavorites
              ? ListView.builder(
                  itemCount: favoriteViewModel.favorites.length,
                  itemBuilder: (context, index) {
                    return FavoriteRepositoryCard(
                      repository: favoriteViewModel.favorites[index],
                    );
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      const Icon(
                        Icons.star_outline,
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'お気に入りがありません',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Builder(
                        builder: (context) => Text(
                          '検索してリポジトリをお気に入りに追加',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withValues(alpha: 0.6),
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
    );
  }
}
