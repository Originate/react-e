require! {
  '../src/bind': eBind
  react
}

examples = [
  description: 'with local classname'
  input: ['.root']
  output: react.DOM.div {className: 'foo'}
  styles: {root: 'foo'}
,
  description: 'with global classname'
  input: ['.foo']
  output: react.DOM.div {className: 'foo'}
  styles: {}
]

describe 'react-e bind', ->
  examples.forEach ({description, input, output, styles}) ->
    it description, ->
      expect(eBind(styles)(...input)).to.eql output
