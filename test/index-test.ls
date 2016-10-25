require! {
  '../src': e
  react
}

child = react.DOM.span {}, 'child'
childrenArray = [
  react.DOM.span {key: 1}, 'child1'
  react.DOM.span {key: 2}, 'child2'
]

examples = [
  input: ['span']
  description: 'tag only'
  output: react.DOM.span {}
,
  input: ['.foo']
  description: 'class only'
  output: react.DOM.div {className: 'foo'}
,
  input: ['.foo.bar']
  description: 'multiple classes'
  output: react.DOM.div {className: 'foo bar'}
,
  input: ['span.foo']
  description: 'tag and class'
  output: react.DOM.span {className: 'foo'}
,
  input: ['span.foo', className: {bar: true, baz: false}]
  description: 'classnames support'
  output: react.DOM.span {className: 'foo bar'}
,
  input: ['div', child]
  description: 'without props, with child'
  output: react.DOM.div {}, child
,
  input: ['div', childrenArray]
  description: 'without props, with children array'
  output: react.DOM.div {}, childrenArray
,
  input: ['div', {'data-value': 1}, child]
  description: 'with props, with child'
  output: react.DOM.div {'data-value': 1}, child
,
  input: ['div', {'data-value': 1}, childrenArray]
  description: 'with props, with children array'
  output: react.DOM.div {'data-value': 1}, childrenArray
]

describe 'react-e', ->
  examples.forEach ({description, input, output}) ->
    it description, ->
      expect(e(...input)).to.eql output
