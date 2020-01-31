# frint-router bindings

Frint router bindings for Nim

## API

```nim
var
  BrowserRouterService*: IRouterService
  HashRouterService*: IRouterService
  MemoryRouterService*: IRouterService

# constructor functions (factories)
proc newBrowserRouterService(options: ServiceOptions): BrowserRouterService
proc newHashRouterService(options: ServiceOptions): HashRouterService
proc newMemoryRouterService(options: ServiceOptions): MemoryRouterService

# route matching
proc getMatch*(service: IRouterService, pattern: cstring, history: JsObject, options: JsObject): auto

# routing methods
proc go*(service: IRouterService, n: cint)
proc push*(service: IRouterService, path: cstring, state: auto)
proc replace*(service: IRouterService, path: cstring, state: auto)
proc goBack*(service: IRouterService)
proc goForward*(service: IRouterService)

# observe
proc getHistoryObs*(service: IRouterService): Observable
proc getMatchObs*(service: IRouterService, pattern: cstring, options: JsObject): Observable
```
