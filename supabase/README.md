# ８LABO Supabase運用ルール

このディレクトリは、８LABO共通WEBアプリのSupabaseデータベース設計・変更履歴をGitHubで管理するためのものです。

## 現在の位置付け

- Supabaseプロジェクト: `8labo-platform`
- 共通DBの正本: Supabase PostgreSQL
- 今後のDB設計・変更履歴の正本: `8labo/8labo.app`
- 2026-08-12にDashboardから作成した初期baselineは旧 `8labo/8labo-app` に保存済みで、現行Supabaseへ適用済みです。
- baselineは現行DBへ再実行しません。

## ８LABO ID

- 人物ごとに一意の整数連番 `1, 2, 3 ...`
- `0001` 等のゼロ埋めはWEB画面上の表示形式のみ
- DB・CSV・Excelでは整数のまま保持
- 内部主キーはUUID
- 一度発行した番号は原則再利用しない

## 共通基盤

人物、Auth紐付け、家族・保護者関係、サービス利用状況、共通測定データ、同意履歴、スタッフ・権限を共通基盤で管理します。

ACADEMY、BizFit、EVENT等は専用UI・業務機能を持ちながら、この共通基盤を参照・更新します。

> データの正本は共通基盤、利用画面は各サービスに最適化する。

## 今後のDB変更

新しいテーブル、カラム、RLS、関数等の変更は `supabase/migrations/` に新しいSQLファイルを追加して履歴を残します。一度適用済みのmigrationを書き換えず、変更は新しいmigrationで行います。

## 秘密情報

Database password、service_role/secret key、個人のAuth UUID、実会員個人情報、`.env` / `.env.local` はGitHubへ保存しません。
