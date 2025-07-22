import 'package:go_router/go_router.dart';
import 'package:yumemi_codecheck/models/github_repo_model.dart';
import 'package:yumemi_codecheck/views/repo_detail/repo_detail_page.dart';
import 'package:yumemi_codecheck/views/search/search_page.dart';

import 'constants/routes.dart';
import 'views/home/home_page.dart';
import 'views/sample/sample_page.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Routes.sample,
      builder: (context, state) => const SamplePage(),
    ),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      path: Routes.repoDetail,
      builder: (context, state) {
        final repo = state.extra as GithubRepoModel;
        return RepoDetailPage(repo: repo);
      },
    ),
  ],
);
