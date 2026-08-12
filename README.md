# ８LABO 共通WEBアプリ

本番用リポジトリです。

- 共通基盤: Supabase `8labo-platform`
- 本番: `8labo.app`
- 試作: `8labo.app.demo`
- 旧 `8labo-app` は当面バックアップとして保持

## 基本原則

- データの正本は８LABO共通Supabase基盤
- 利用画面は各サービスに最適化
- ８LABO IDは人物ごとの整数連番（1, 2, 3…）
- `0001` 等のゼロ埋めは表示上のみ
- 内部主キーはUUID
- DB変更は `supabase/migrations/` で履歴管理
- 秘密鍵、個人固有Auth UUID、実個人情報はGitHubへ保存しない
