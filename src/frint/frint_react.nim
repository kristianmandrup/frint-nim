import macros, dom, jsffi

{.experimental: "callOperator".}

when not defined(js):
  {.error: "frint-react.nim is only available for the JS target".}

type IRegion = JsObject
  name*: cstring) # The name of the Region
  data*: JsObject # Data to be made available to rendered App
  uniqueKey*: cstring # Used when there are multiple Regions of the same name. It prop must be unique and fixed throughout the whole app.
  className*: cstring # The className used by Region wrapper element

var
  Region*: IRegion {.importjs, nodecl.}
  ReactHandler: JsObject {.importjs, nodecl.}

{.push importcpp.}
proc render*(app: App, node: Element)
proc observe*(onChange: proc(app: App, propsObs: Observable): Observable |
    JsObject): auto
{.pop.}

proc observeComponent*(component: Component, onChange: proc(app: App, propsObs: Observable): Observable |
JsObject): auto =
  {.emit: ["observe", "(", onChange, ")(", component, ")"] .}

