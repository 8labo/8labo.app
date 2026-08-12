# Supabase migrations

2026-08-12の初期DB構造はSupabase `8labo-platform` に適用済みです。初期baselineの原本は旧 `8labo/8labo-app` に保存しています。

今後のDB変更はこのディレクトリに時系列で追加します。

例:

```text
20260813090000_add_academy_profiles.sql
20260815120000_add_assessment_import.sql
```

適用済みmigrationは原則書き換えず、修正が必要な場合は新しいmigrationを追加します。
