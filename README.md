# react-e [![CircleCI](https://circleci.com/gh/Originate/react-e.svg?style=svg)](https://circleci.com/gh/Originate/react-e)

React helper to generate elements

## Installing
`npm install --save react-e`

## Example Usage

```coffeescript
e = require 'react-e'

e '.container',
  e 'button.primary', 'Click me'
  e 'span.text', className: active: true, 'Some text'
```
Is equivalent to:
```jsx
<div className="container">
  <button className="primary">Click me</button>
  <span className="text active">Some text</span>
</div>
```

## Use with css modules

```coffeescript
styles = require 'index.css'
###
styles =
  container: 'local1'
  primary: 'local2'
  text: 'local3'
###
e = require('react-e/bind')(styles)

e '.container',
  e 'button.primary', 'Click me'
  e 'span.text', className: active: true, 'Some text'
```
Is equivalent to:
```jsx
<div className="local1">
  <button className="local2">Click me</button>
  <span className="local3 active">Some text</span>
</div>
```
