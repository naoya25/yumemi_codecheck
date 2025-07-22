import 'package:go_router/go_router.dart';
import 'package:yumemi_codecheck/constants/routes.dart';
import 'package:yumemi_codecheck/views/home/page.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
