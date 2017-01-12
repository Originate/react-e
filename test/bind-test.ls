require! {
  '../src/bind': eBind
  react
}


TestComponent = -> react.DOM.div {}, 'test'

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
,
  description: 'component with local classname'
  input: [TestComponent, className: 'root']
  output: react.create-element TestComponent, {className: 'foo'}
  styles: {root: 'foo'}
,
  description: 'component with global classname'
  input: [TestComponent, className: 'foo']
  output: react.create-element TestComponent, {className: 'foo'}
  styles: {}
]

describe 'react-e bind', ->
  examples.forEach ({description, input, output, styles}) ->
    specify description, ->
      expect(eBind(styles)(...input)).to.eql output
