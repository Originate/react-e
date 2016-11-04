require! {
  'lodash.assign': assign
  react
}

module.exports = (classnames) ->
  (elementStr, opts = {}, ...children) ->
    [elementTag, ...classes] = elementStr.split '.'

    if opts not instanceof Object or opts instanceof Array or opts.$$typeof?
      children = [opts, ...children]
      opts = {}

    clonedOpts = assign {}, opts

    clonedOpts.className = classnames classes, clonedOpts.className
    delete clonedOpts.className unless clonedOpts.className

    react.DOM[elementTag or 'div'] clonedOpts, ...children
