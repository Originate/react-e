require! {
  '../src': e
  react
}

child = react.DOM.span {}, 'child'
childrenArray = [
  react.DOM.span {key: 1}, 'child1'
  react.DOM.span {key: 2}, 'child2'
]

TestComponent = -> react.DOM.div {}, 'test'

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
  input: ['span', className: {bar: false}]
  description: 'overriding empty class name'
  output: react.DOM.span {}
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
,
  input: [TestComponent]
  description: 'component'
  output: react.create-element TestComponent
,
  input: [TestComponent, {'data-value': 1}]
  description: 'component, with props'
  output: react.create-element TestComponent, {'data-value': 1}
,
  input: [TestComponent, {'data-value': 1}, child]
  description: 'component, with props, with child'
  output: react.create-element TestComponent, {'data-value': 1}, child
,
  input: [TestComponent, ...childrenArray]
  description: 'component, with children'
  output: react.create-element TestComponent, {}, childrenArray
]

describe 'react-e' ->
  examples.forEach ({description, input, output}) ->
    specify description, ->
      expect(e(...input)).to.eql output

  specify 'does not mutate the passed in opts' ->
    props = className: {foo: false}
    e('span', props)
    expect(props).to.eql className: {foo: false}
