@include "src/lib/shell.awk"
@include "src/lib/logger.awk"
@include "test/testutil.awk"

{
  assertEqual("hoge\nfuga\n", shell::exec("echo \"hoge\nfuga\""))
}
