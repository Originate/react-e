require! {
  react
}


is-props-object = (thing) ->
  typeof! thing is \Object and not thing.$$typeof?


module.exports = (classnames) -> (element, opts, ...children) ->
  if typeof element is \string
    [element, ...classes] = element.split '.'
    element = 'div' if element is ''

  cloned-opts = if opts |> is-props-object
    {...opts}
  else
    children.unshift opts if opts?
    {}

  cloned-opts.class-name = classnames classes, cloned-opts.class-name
  delete cloned-opts.class-name unless cloned-opts.class-name

  react.create-element element, cloned-opts, ...children
