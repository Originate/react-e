require! {
  react
}

module.exports = (classnames) ->
  (elementStr, opts = {}, ...children) ->
    [elementTag, ...classes] = elementStr.split '.'

    if opts not instanceof Object or opts instanceof Array or opts.$$typeof?
      children = [opts, ...children]
      opts = {}

    allClasses = classnames classes, opts.className
    opts.className = allClasses if allClasses

    react.DOM[elementTag or 'div'] opts, ...children
