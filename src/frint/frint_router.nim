import macros, dom, jsffi
# TODO: import rxjs module to use RxJS bindings and types

{.experimental: "callOperator".}

when not defined(js):
  {.error: "frint-router.nim is only available for the JS target".}

type
  IRouterService = JsObject
  ServiceOptions = JsObject
    enableCache*: bool,
    cacheLimit*: bool

var
  BrowserRouterService*: IRouterService {.importjs, nodecl.}
  HashRouterService*: IRouterService {.importjs, nodecl.}
  MemoryRouterService*: IRouterService {.importjs, nodecl.}

{.push importcpp.}
# constructor functions (factories)
proc newBrowserRouterService(options: ServiceOptions): BrowserRouterService {.importjs "new BrowserRouterService(#)" .}
proc newHashRouterService(options: ServiceOptions): HashRouterService {.importjs "new HashRouterService(#)" .}
proc newMemoryRouterService(options: ServiceOptions): MemoryRouterService {.importjs "new MemoryRouterService(#)" .}

# route matching
proc getMatch*(service: IRouterService, pattern: cstring, history: JsObject, options: JsObject): auto

# routing methods
proc go*(service: IRouterService, n: cint)
proc push*(service: IRouterService, path: cstring, state: auto)
proc replace*(service: IRouterService, path: cstring, state: auto)
proc goBack*(service: IRouterService)
proc goForward*(service: IRouterService)
{.pop.}

# observe
proc getHistoryObs*(service: IRouterService): Observable {.importjs "getHistory$" .}
proc getMatchObs*(service: IRouterService, pattern: cstring, options: JsObject): Observable {.importjs "getMatch$" .}