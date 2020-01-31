# frint-router bindings

FrintJS router bindings for Nim

## API

```nim
var
  FrintStore: FrintStoreGlobal

# static methods on FrintStore global object
# constructor
proc createStore*(frintStoreGlobal: FrintStore, storeConfig: StoreConfig): Store

# combine
proc combineReducers*(frintStoreGlobal: FrintStore, reducers: JsObject): auto
proc combineEpics*(frintStoreGlobal: FrintStore)

# store instance methods
proc dispatch*(store: Store, action: auto)

# store instance getters
proc getState*(store: Store): auto
proc getStateObs*(store: Store): Observable

# store config methods
proc reducer*(storeConfig: StoreConfig, proc()): auto
proc epic*(storeConfig: StoreConfig, proc(actions: Observable): Observable) 
```
