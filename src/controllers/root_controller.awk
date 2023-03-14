function root_controller() {
  render_html(200, "\
<html>\
  <head>\
    <style>\
      html {\
        max-width: 70ch;\
        padding: 3em 1em;\
        margin: auto;\
        line-height: 1.75;\
        font-size: 1.25em;\
      }\
      h1,h2,h3,h4,h5,h6 {\
        margin: 3em 0 1em;\
      }\
      p,ul,ol {\
        margin-bottom: 2em;\
        color: #1d1d1d;\
        font-family: sans-serif;\
      }\
    </style>\
  </head>\
  <body>\
    <h1>hello, awkblog!</h1>\
    <div><a href=\"/authed\">/authed</a></div>\
    <div><a href=\"/login\">/login</a></div>\
    <div><a href=\"/authed/posts\">/authed/posts</a></div>\
    <div><a href=\"/\">/</a></div>\
  </body>\
</html>");
}
