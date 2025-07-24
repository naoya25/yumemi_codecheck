import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:yumemi_codecheck/models/github_repo_model.dart';
import 'package:yumemi_codecheck/view_models/favorite_view_model.dart';
import 'package:yumemi_codecheck/views/repo_detail/components/description_view.dart';
import 'package:yumemi_codecheck/views/repo_detail/components/header.dart';
import 'package:yumemi_codecheck/views/repo_detail/components/stats_view.dart';

class RepoDetailPage extends HookWidget {
  const RepoDetailPage({super.key, required this.repo});

  final GithubRepoModel repo;

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = context.watch<FavoriteViewModel>();
    final isFavorite = useState(false);

    useEffect(() {
      isFavorite.value = favoriteViewModel.isFavoriteSync(repo.id);
      return null;
    }, [favoriteViewModel.favorites]);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(repo.name),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite.value ? Icons.star : Icons.star_outline,
              color: isFavorite.value ? Colors.amber : null,
            ),
            onPressed: () async {
              if (isFavorite.value) {
                await favoriteViewModel.removeFavorite(repo.id);
              } else {
                await favoriteViewModel.addFavorite(repo);
              }
              isFavorite.value = !isFavorite.value;
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(repo: repo),
            const Divider(height: 1),
            StatsView(repo: repo),
            const Divider(height: 1),
            if (repo.description != null)
              DescriptionView(description: repo.description!),
          ],
        ),
      ),
    );
  }
}
