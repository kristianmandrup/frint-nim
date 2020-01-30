import macros, dom, jsffi
# TODO: import rxjs module to use RxJS bindings and types

{.experimental: "callOperator".}

when not defined(js):
  {.error: "Frint.nim is only available for the JS target".}

type
  FrintGlobal* = JsObject
  App* = JsObject

  ProviderOptions = JsObject
    name*: cstring,
    deps*: seq[cstring],
    cascade*: bool,
    scoped*: bool,    
    useValue*: auto,
    useClass*: auto # id ref

  AppOptions* = JsObject
    name*: cstring,
    providers*: seq[auto] 

  RegisterAppOptions = JsObject
    name*: cstring,
    multi*: bool

  Observable = JsObject # TODO: use RxJS Nim bindings type

var
  Frint*{.importc, nodecl.}: FrintGlobal

{.push importcpp.}

proc useFactory*(options: ProviderOptions, proc(): auto)

proc initialize*(options: AppOptions, proc(): auto)
proc beforeDestroy*(options: AppOptions, proc(): auto)

# Frint
proc createApp*(frint: FrintGlobal, appPptions: AppOptions): App

# App instance methods
proc registerApp*(app: App, childApp: App, options: RegisterAppOptions)
proc get*(app: App, name: cstring): auto
proc getName*(app: App, name: cstring): auto
proc getOption*(app: App): auto
proc getRootApp*(app: App): App
proc getParentApp*(app: App): App
proc getParentApps*(app: App): seq[App]
proc getProviders*(app: App): seq[App]
proc getProvider*(app: App, name: cstring): auto
proc hasAppInstance*(app: App, name: cstring): bool
proc getAppInstance*(app: App, name: cstring): App
proc instantiateApp*(app: App, name: cstring, region: cstring, regionKey: cstring): seq[App]
proc destroyApp*(app: App, name: cstring, region: cstring, regionKey: cstring)
{.pop.}

proc getApps*(app: App, name: cstring, region: cstring, regionKey: cstring): Observable {.importjs "getApps$".}
proc getAppOnceAvailable*(app: App, name: cstring, region: cstring, regionKey: cstring): Observable {.importjs "getAppOnceAvailable$".}
