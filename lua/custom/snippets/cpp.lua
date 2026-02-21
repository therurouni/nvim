local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s("cp", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "#define int long long",
      "#define endl '\\n'",
      "using pii = pair<int,int>;",
      "const int mod = 1000000007;",
      "const int inf = 1e18;",
      "",
      "",
      "/*",
      "Observations",
      "\t",
      "    If I can solve it, how would the soln be?",
      "*/",
      "",
      "void solve() {",
      "    ",
    }),
    i(0),
    t({
      "",
      "}",
      "",
      "signed main() {",
      "    ios::sync_with_stdio(false);",
      "    cin.tie(nullptr);",
      "",
      "    int t;",
      "    cin >> t;",
      "    while (t--) {",
      "        solve();",
      "    }",
      "    return 0;",
      "}",
      "",
      "// Golden Rules",
      "/*",
      "    Solutions are simple.",
      "",
      "    Proofs are simple.",
      "",
      "    Implementations are simple.",
      "*/",
    }),
  }),

}
