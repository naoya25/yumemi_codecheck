import 'package:flutter/material.dart';
import 'package:yumemi_codecheck/models/github_repo_model.dart';
import 'package:yumemi_codecheck/utils/format_num.dart';

class StatsView extends StatelessWidget {
  const StatsView({super.key, required this.repo});

  final GithubRepoModel repo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatItem(
            icon: Icons.star,
            label: 'Stars',
            count: repo.stargazersCount,
            color: Colors.amber,
          ),
          StatItem(
            icon: Icons.visibility,
            label: 'Watchers',
            count: repo.watchersCount,
            color: Colors.purple,
          ),
          StatItem(
            icon: Icons.call_split,
            label: 'Forks',
            count: repo.forksCount,
            color: Colors.blue,
          ),
          StatItem(
            icon: Icons.error_outline,
            label: 'Issues',
            count: repo.openIssuesCount,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    required this.icon,
    required this.label,
    required this.count,
    required this.color,
  });

  final IconData icon;
  final String label;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          formatNumWithSuffix(count),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
