BEGIN {
  pgsql::createConnection()

  query = "SELECT count(id) as ids FROM posts;"
  pgsql::exec(query)
  rows = pgsql::fetchRows()
  print "Database Healthcheck: count(posts.id) (rows:" rows ") ... " pgsql::fetchResult(0, "ids")

  print "Start awkblog. listen port " PORT " ..."
  router::routing_register("GET", "/", "controller::get")
  router::routing_register("GET", "/test", "controller::test__get")
  router::routing_register("GET", "/login", "controller::login__get")
  router::routing_register("GET", "/oauth-callback" "controller::oauth_callback__get")
  router::routing_register("GET", "/authed", "controller::authed__get")
  router::routing_register("GET", "/authed/posts/new", "controller::authed__posts__new__get")
  router::routing_register("GET", "/authed/posts", "controller::authed__posts__get")
  router::routing_register("POST", "/authed/posts", "controller::authed__posts__post")
  router::routing_register("GET", "/@yammerjp", "controller::_account_id__get")
  router::routing_register_notfound("controller::notfound")

  http::initializeHttp();
}

!http::REQUEST_PROCESS {
  # start to process a request;
  http::receiveRequest();
}

{
  router::routing_call(http::getMethod(), http::getPath())
}
