import macros, dom, jsffi
# TODO: import rxjs module to use RxJS bindings and types

{.experimental: "callOperator".}

when not defined(js):
  {.error: "frint-store.nim is only available for the JS target".}

type
  FrintStoreGlobal* = JsObject
  Store*= JsObject
  StoreConfig* = JsObject
    initialState*
    console*,
    appendAction*: JsObject,
    thunkArgument*,
    deps*,
    enableLogger*: bool
    
var
  FrintStore*{.importc, nodecl.}: FrintStoreGlobal

{.push importcpp.}
proc createStore*(frintStoreGlobal: FrintStore, storeConfig: StoreConfig): Store
proc combineReducers*(frintStoreGlobal: FrintStore, reducers: JsObject): auto
proc combineEpics*(frintStoreGlobal: FrintStore)
proc dispatch*(store: Store, action: auto) 

proc reducer*(storeConfig: StoreConfig, proc()): auto
proc epic*(storeConfig: StoreConfig, proc(actions: Observable): Observable) 
proc getState*(store: Store): auto
{.pop.}

proc getStateObs*(store: Store): Observable {.importjs "getState$".}



