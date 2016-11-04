require! {
  react
}

module.exports = (classnames) ->
  (elementStr, opts = {}, ...children) ->
    [elementTag, ...classes] = elementStr.split '.'

    if opts not instanceof Object or opts instanceof Array or opts.$$typeof?
      children = [opts, ...children]
      opts = {}

    opts.className = classnames classes, opts.className
    delete opts.className unless opts.className

    react.DOM[elementTag or 'div'] opts, ...children
