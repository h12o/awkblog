@namespace "controller"

function oauth_callback__get() {
  error = http::HTTP_REQUEST_PARAMETERS["error"]
  code = http::HTTP_REQUEST_PARAMETERS["code"]
  if (code == "" || error != "") {
    http::sed(500, "failed")
  }
  # TODO verify state
  ret = lib::commandExec("curl -X POST -H 'Accept: application/json' 'https://github.com/login/oauth/access_token?client_id=" awk::AWKBLOG_OAUTH_CLIENT_KEY "&client_secret=" awk::AWKBLOG_OAUTH_CLIENT_SECRET "&code=" code "'")
  access_token = lib::jsonExtractString(ret, "access_token")
  if (access_token == "") {
    http::sed(500, "access token is not found")
  }
  ret = lib::commandExec("curl -H 'Authorization: Bearer " access_token "' -H 'Accept: application/vnd.github+json' -H 'X-GitHub-Api-Version: 2022-11-28' https://api.github.com/user")
  username = lib::jsonExtractString(ret, "login")
  id = lib::jsonExtractNumber(ret, "id")
  auth::login(id, username)
  http::redirect302(AWKBLOG::HOST_NAME "/authed")
}
