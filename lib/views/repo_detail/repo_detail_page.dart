import 'package:flutter/material.dart';
import 'package:yumemi_codecheck/models/github_repo_model.dart';
import 'package:yumemi_codecheck/views/repo_detail/components/description_view.dart';
import 'package:yumemi_codecheck/views/repo_detail/components/header.dart';
import 'package:yumemi_codecheck/views/repo_detail/components/stats_view.dart';

class RepoDetailPage extends StatelessWidget {
  const RepoDetailPage({super.key, required this.repo});

  final GithubRepoModel repo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(repo.name),
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
