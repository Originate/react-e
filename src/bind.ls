require! {
  './base': base
  'classnames/bind': classnames
}

module.exports = (styles) -> base classnames.bind(styles)
