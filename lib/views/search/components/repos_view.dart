import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumemi_codecheck/view_models/search_view_model.dart';
import 'package:yumemi_codecheck/views/search/components/repo_item.dart';

class ReposView extends StatelessWidget {
  const ReposView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchViewModel = context.watch<SearchViewModel>();

    if (searchViewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (searchViewModel.errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            '検索中にエラーが発生しました',
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (!searchViewModel.hasSearched) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'リポジトリを検索してください',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    if (!searchViewModel.hasResults) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              '検索結果が見つかりませんでした',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: searchViewModel.repos.length,
      itemBuilder: (context, index) {
        final repo = searchViewModel.repos[index];
        return RepoItem(repo: repo);
      },
    );
  }
}
