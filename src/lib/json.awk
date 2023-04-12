@namespace "lib"

function jsonExtractString(json_str, key,    splitted) {
  split(json_str, splitted, "\"")
  for (i = 1; i<=length(splitted);i++) {
    if (splitted[i] == key) {
      return splitted[i+2]
    }
  }
  return ""
}

function jsonExtractNumber(json_str, key,        splitted, value) {
  split(json_str, splitted, "\"")
  for (i = 1; i<=length(splitted);i++) {
    if (splitted[i] == key) {
      value = splitted[i+1]
      split(value, splitted, ":")
      value = splitted[2]
      split(value, splitted, ",")
      return splitted[1]
      split(value, splitted, "}")
      return splitted[1]
    }
  }
  return ""

}
