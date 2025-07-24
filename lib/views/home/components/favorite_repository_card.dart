import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/routes.dart';
import '../../../models/github_repo_model.dart';
import '../../../utils/format_num.dart';

class FavoriteRepositoryCard extends StatelessWidget {
  const FavoriteRepositoryCard({
    super.key,
    required this.repository,
  });

  final GithubRepoModel repository;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          context.push(
            Routes.repoDetail,
            extra: repository,
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(repository.owner.avatarUrl),
                    radius: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          repository.fullName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        if (repository.language != null)
                          Text(
                            repository.language!,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (repository.description != null) ...[
                const SizedBox(height: 8),
                Text(
                  repository.description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7),
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildStatItem(
                    context,
                    Icons.star_outline,
                    formatNumWithSuffix(repository.stargazersCount),
                  ),
                  const SizedBox(width: 16),
                  _buildStatItem(
                    context,
                    Icons.fork_right,
                    formatNumWithSuffix(repository.forksCount),
                  ),
                  const SizedBox(width: 16),
                  _buildStatItem(
                    context,
                    Icons.error_outline,
                    formatNumWithSuffix(repository.openIssuesCount),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, IconData icon, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}