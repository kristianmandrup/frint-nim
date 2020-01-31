# frint-router-react bindings

## API

```nim
type 
  IReactRoute = JsObject
    path*: cstring) # The pattern to match against
    exact*: bool # Match the path exactly (with no suffix in the path)
    compponent*: Component # React Component to render
    app*: App # Frint App that you want to render
  ILink = JsObject
    to*: cstring # Path to navigate to
    `type`*: cstring) # If you want the Link to render as a <button> with its type, otherwise defaults to plain anchors (<a>)
    className*: cstring # CSS class name
    activeClassName*: cstring # CSS class name to render with, if current URL matches the Link's
    exact*: bool # Trigger activeClassName by matching the path exactly
    children*: Node # The body of the Link
  ISwitch = JsObject
    children*: Node # Children of <Route>s

var
  Link*: ILink
  Route: IReactRoute
  Switch*: ISwitch
```
