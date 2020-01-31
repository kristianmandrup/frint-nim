# Nim bindings for FrintJS

[FrintJS](https://frint.js.org/) is a powerful reactive, modular web framework for Micro Frontends, 
leveraging RxJS.

FrintJS has built-in support for:

- React
- Vue
- Reaxt Native
- Preact

Frint binding modules for:

- `frint-data` Reactive data modelling ([frint-data docs](frint-data.md))
- `frint-store` State management with reactive stores ([frint-store docs](frint-store.md))
- `frint-router` Router services for SPAs ([frint-router docs](frint-router.md))

```nim
var
  Frint*: FrintGlobal

# TODO: use from Nim rxjs bindings module
proc subscribe*(observable: Observable, proc(): auto)

proc useFactory*(options: ProviderOptions, proc(): auto)

proc initialize*(options: AppOptions, proc(): auto)
proc beforeDestroy*(options: AppOptions, proc(): auto)

# Frint App factory
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

# observe
proc getApps*(app: App, name: cstring, region: cstring, regionKey: cstring): Observable
proc getAppOnceAvailable*(app: App, name: cstring, region: cstring, regionKey: cstring): Observable
```

## React (TODO)

- `frint-react` React.js integration
- `frint-react-server` Rerver-side rendering of Apps
- `frint-router-react` React components for building SPAs

## TODO

Update the Frint CLI to generate Nim code with bindings to FrintJS and RxJS

- `frint-cli` CLI runner