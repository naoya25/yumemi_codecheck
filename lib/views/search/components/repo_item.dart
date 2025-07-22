import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_codecheck/constants/routes.dart';
import 'package:yumemi_codecheck/models/github_repo_model.dart';
import 'package:yumemi_codecheck/utils/format_num.dart';

class RepoItem extends StatelessWidget {
  const RepoItem({super.key, required this.repo});

  final GithubRepoModel repo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: InkWell(
        onTap: () {
          context.push(Routes.repoDetail, extra: repo);
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(repo.owner.avatarUrl),
                    radius: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          repo.fullName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          repo.owner.login,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (repo.description != null) ...[
                const SizedBox(height: 12),
                Text(
                  repo.description!,
                  style: const TextStyle(fontSize: 14),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildStat(
                    Icons.star_border,
                    repo.stargazersCount,
                    Colors.amber,
                  ),
                  const SizedBox(width: 16),
                  _buildStat(
                    Icons.call_split,
                    repo.forksCount,
                    Colors.blue,
                  ),
                  const SizedBox(width: 16),
                  _buildStat(
                    Icons.error_outline,
                    repo.openIssuesCount,
                    Colors.green,
                  ),
                  const Spacer(),
                  if (repo.language != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        repo.language!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(IconData icon, int count, Color color) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(
          formatNumWithSuffix(count),
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
