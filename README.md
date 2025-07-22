# Github Repository Search App

[株式会社ゆめみ Flutter エンジニアコードチェック](https://github.com/yumemi-inc/flutter-engineer-codecheck)の課題として開発された、GitHubリポジトリ検索アプリです。

## 概要

GitHubのリポジトリを検索し、検索結果の一覧表示・詳細表示ができるFlutterアプリケーションです。

## 技術スタック

- **Flutter**: ^3.6.0
- **Dart**: ^3.6.0
- **状態管理**: Provider + flutter_hooks
- **ルーティング**: go_router
- **HTTP通信**: dio
- **JSON処理**: freezed + json_annotation

## アーキテクチャ

```
lib/
├── main.dart                 # アプリエントリーポイント
├── views/                    # UI層（画面・Widget）
├── view_models/             # 状態管理・ビジネスロジック
├── repositories/            # データアクセス層
├── services/               # 外部API・共通サービス
├── models/                 # データモデル
├── utils/                  # ユーティリティ関数
└── constants/              # 定数定義
```

## セットアップ

### 1. 依存関係のインストール

```bash
flutter pub get
```

### 2. コード生成（モデルクラス）

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. アプリの起動

```bash
flutter run
```

## 開発コマンド

```bash
# 依存関係の取得
flutter pub get

# コード生成
flutter packages pub run build_runner build --delete-conflicting-outputs

# 静的解析
flutter analyze

# コードフォーマット
dart format lib/

# テスト実行
flutter test                # 全テスト実行
flutter test test/unit/     # 単体テストのみ
flutter test test/widget/   # Widgetテストのみ

# ビルド
flutter build apk           # Android
flutter build ios          # iOS
```

## 機能

- [ ] GitHub リポジトリの検索
- [ ] 検索結果の一覧表示
- [ ] リポジトリの詳細表示
- [ ] お気に入り機能（予定）

## 参考資料

- [課題仕様](https://github.com/yumemi-inc/flutter-engineer-codecheck)
- [Flutter公式ドキュメント](https://docs.flutter.dev/)
- [GitHub API v3](https://docs.github.com/en/rest)
