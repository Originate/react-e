require! {
  'lodash.assign': assign
  react
}


module.exports = (classnames) -> (element, opts = {}, ...children) ->
  if typeof element is \string
    [element, ...classes] = element.split '.'
    element = 'div' if element is ''

  if opts not instanceof Object or opts instanceof Array or opts.$$typeof?
    children = [opts, ...children]
    opts = {}

  cloned-opts = assign {}, opts

  cloned-opts.class-name = classnames classes, cloned-opts.class-name
  delete cloned-opts.class-name unless cloned-opts.class-name

  react.create-element element, cloned-opts, ...children
