import macros, dom, jsffi

{.experimental: "callOperator".}

when not defined(js):
  {.error: "frint-react-server.nim is only available for the JS target".}

proc renderToString*(app: App): cstring {.importjs.}
