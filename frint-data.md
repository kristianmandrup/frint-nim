# frint-router bindings

FrintJS router bindings for Nim

## API

```nim
var
  Types*: ITypes
  TypesError*: JsObject
  MethodError*: JsObject
  CollectionError*: JsObject

# Model
# factory
proc createModel*(modelOptions: ModelOptions): Model

# Collection factory options method to run code to initialize new model
proc initialize*(options: ModelOptions, fn: proc())

# static global utility function
proc isModel(obj: JsObject): bool

# Model instance methods
proc getIn*(model: Model): auto
proc get*(model: Model, path: cstring): auto
proc toJS*(model: Model, path: cstring): auto
proc destroy*(model: Model)

# Collection
# factory
proc createCollection*(collectionOptions: CollectionOptions): Collection

# Collection factory options method to run code to initialize new collection
proc initialize*(options: CollectionOptions, fn: proc())

# static global utility function
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

proc toJS*(collection: Collection): JsObject
proc get*(collection: Collection): auto

# observe

# Model
proc getObs*(model: Model, path: cstring): Observable
proc toJSObs*(model: Model, path: cstring): Observable

# Collection
proc atObs*(collection: Collection, index: cint): Observable[Collection] {.importjs "at$" .}
proc everyObs*(collection: Collection, iteratorFn: proc()): Observable[bool]
proc filterObs*(collection: Collection, iteratorFn: proc()): Observable[bool]
proc findObs*(collection: Collection, iteratorFn: proc()): Observable[bool]
