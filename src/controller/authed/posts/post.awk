@namespace "controller"

function authed__posts__post(        title, content, account_id, query, params) {
  lib::decodeWwwForm(http::HTTP_REQUEST["body"])
  title = html::escape(lib::KV["title"])
  content = html::escape(lib::KV["content"])
  account_id = auth::getAccountId()
  query = "INSERT INTO posts ( account_id, title, content ) VALUES ($1, $2, $3);"
  params[1] = account_id
  params[2] = title
  params[3] = content
  pgsql::exec(query, params)

  http::redirect302(AWKBLOG::HOST_NAME "/authed/posts")
}
