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
# static methods on FrintStore global object
proc createStore*(frintStoreGlobal: FrintStoreGlobal, storeConfig: StoreConfig): Store
proc combineReducers*(frintStoreGlobal: FrintStoreGlobal, reducers: JsObject): auto
proc combineEpics*(frintStoreGlobal: FrintStoreGlobal)

# store instance methods
proc dispatch*(store: Store, action: auto) 
proc getState*(store: Store): auto

# store connfig options methods
proc reducer*(storeConfig: StoreConfig, proc()): auto
proc epic*(storeConfig: StoreConfig, proc(actions: Observable): Observable) 
{.pop.}

# store instance methods
proc getStateObs*(store: Store): Observable {.importjs "getState$".}



