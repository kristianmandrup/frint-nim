# frint-router bindings

## API

```nim
var
  Region*: IRegion
  ReactHandler: JsObject

proc render*(app: App, node: Element)
proc observe*(fn: proc(app: App, propsObs: Observable): Observable | JsObject): auto
```
