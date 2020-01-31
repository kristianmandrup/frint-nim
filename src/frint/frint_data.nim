import macros, dom, jsffi
# TODO: import rxjs module to use RxJS bindings and types

{.experimental: "callOperator".}

when not defined(js):
  {.error: "frint-data.nim is only available for the JS target".}

type
  ITypes* = JsObject
    `UUID`*,
    `model`*,
    `collection`*,
    `bool`*,
    `string`*,
    `number`* ,
    `enum`*,
    `date`*
  Model = JsObject
  Collection = JsObject
    length*: cint
  ModelOptions = JsObject
    schema*: JsObject
  CollectionOptions = JsObject
    model*: Model    

var 
  Types*: ITypes {.importjs, nodecl.}
  TypesError*: JsObject {.importjs, nodecl.}
  MethodError*: JsObject {.importjs, nodecl.}
  CollectionError*: JsObject {.importjs, nodecl.}

{.push importcpp.}
# Model
proc createModel*(modelOptions: ModelOptions): Model
proc initialize*(options: ModelOptions, fn: proc())
proc isModel(obj: JsObject): bool

# Model instance methods
proc getIn*(model: Model): auto
proc get*(model: Model, path: cstring): auto
proc toJS*(model: Model, path: cstring): auto
proc destroy*(model: Model)

# Collection
proc createCollection*(collectionOptions: CollectionOptions): Collection
proc initialize*(options: CollectionOptions, fn: proc())
proc isCollection(obj: JsObject): bool

# Collection instance methods
proc at*(collection: Collection, index: cint): Collection
proc push*(collection: Collection, model: Model): Collection
proc every*(collection: Collection, iteratorFn: proc()): bool
proc filter*(collection: Collection, iteratorFn: proc()): bool
proc find*(collection: Collection, iteratorFn: proc()): bool
proc forEach*(collection: Collection, iteratorFn: proc()): bool
proc includes*(collection: Collection, model: Model): bool
proc indexOf*(collection: Collection, model: Model): cint
proc map*(collection: Collection, iteratorFn: proc()): bool
proc reduce*(collection: Collection, iteratorFn: proc()): auto
proc some*(collection: Collection, iteratorFn: proc()): auto
proc pop*(collection: Collection): Model
proc shift*(collection: Collection): Model
proc unshift*(collection: Collection): cint
proc removeFrom*(collection: Collection, model: Model)
proc first*(collection: Collection): Model
proc last*(collection: Collection): Model
proc take*(collection: Collection, index: cint): seq[Model]
proc takeRight*(collection: Collection, index: cint): seq[Model]
proc destroy*(collection: Collection)
proc toJS*(collection: Collection)
proc get*(collection: Collection)
{.pop.}

# Model
proc getObs*(model: Model, path: cstring): Observable {.importjs "get$" .}
proc toJSObs*(model: Model, path: cstring): Observable {.importjs "toJs$" .}

# Collection
proc atObs*(collection: Collection, index: cint): Observable[Collection] {.importjs "at$" .}
proc everyObs*(collection: Collection, iteratorFn: proc()): Observable[bool]
proc filterObs*(collection: Collection, iteratorFn: proc()): Observable[bool]
proc findObs*(collection: Collection, iteratorFn: proc()): Observable[bool]
