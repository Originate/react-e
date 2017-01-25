# react-e [![CircleCI](https://circleci.com/gh/Originate/react-e.svg?style=svg)](https://circleci.com/gh/Originate/react-e)

Concise, readable JSX and react.createElement alternative for non-Babel code bases

```javascript
$ = require('react-e')

$(Modal,
  $('.container',
    $('span.text', {className: {active: this.state.active}}, 'Some text'),
    $(Button, {className: 'primary'}, 'Close')
  )
)
```
Is equivalent to:
```jsx
<Modal>
  <div className="container">
    <span className={'text' + (this.state.active ? ' active' : '')}>Some text</span>
    <Button className='primary'>Close</Button>
  </div>
</Modal>
```


## Installation
`npm install --save react-e`


## Features

React-e is a drop in replacement for `react.createElement`, but it provides syntactic advantages:

#### `props` can be omitted even if you have children:
<table>
  <tr>
    <th>react-e</th>
    <td><pre lang="javascript">
$('div',
  $('span', 'Hello world'))</pre></td>
  </tr>
  <tr>
    <th>react.createElement</th>
    <td><pre lang="javascript">
createElement('div', {},
  createElement('span', {}, 'Hello world'))</pre></td>
  </tr>
  <tr>
    <th>JSX</th>
    <td><pre lang="jsx">
&lt;div&gt;
  &lt;span&gt;Hello world&lt;/span&gt;
&lt;/div&gt;</pre></td>
  </tr>
</table>

#### static classnames can be provided inline using [pug](https://www.npmjs.com/package/pug) syntax:
<table>
  <tr>
    <th>react-e</th>
    <td><pre lang="javascript">$('label.foo.bar')</pre></td>
  </tr>
  <tr>
    <th>react.createElement</th>
    <td><pre lang="javascript">createElement('label', {className: 'foo bar'})</pre></td>
  </tr>
  <tr>
    <th>JSX</th>
    <td><pre lang="jsx">&lt;label className="foo bar"&gt;&lt;/label&gt;</pre></td>
  </tr>
</table>

#### `div` is assumed if tag is not provided:
<table>
  <tr>
    <th>react-e</th>
    <td><pre lang="javascript">$('.foo')</pre></td>
  </tr>
  <tr>
    <th>react.createElement</th>
    <td><pre lang="javascript">createElement('div', {className: 'foo'})</pre></td>
  </tr>
  <tr>
    <th>JSX</th>
    <td><pre lang="jsx">&lt;div className="foo"&gt;&lt;/div&gt;</pre></td>
  </tr>
</table>

#### [classnames](https://www.npmjs.com/package/classnames) module is built-in:
<table>
  <tr>
    <th>react-e</th>
    <td><pre lang="javascript">
$('.foo', {
  className: {active: this.state.active}
})</pre></td>
  </tr>
  <tr>
    <th>react.createElement</th>
    <td><pre lang="javascript">
classnames = require('classnames')

createElement('div', {
  className: classnames('foo', {active: this.state.active})
})</pre></td>
  </tr>
  <tr>
    <th>JSX</th>
    <td><pre lang="jsx">
classnames = require('classnames')

&lt;div
  className={classnames('foo', {active: this.state.active})}
&gt;&lt;/div&gt;</pre></td>
  </tr>
</table>

#### [css modules](https://github.com/css-modules/css-modules) are bound when using `require('react-e/bind')(styles)`:
<table>
  <tr>
    <th>react-e</th>
    <td><pre lang="javascript">
styles = require('./stylesheet.css')
$ = require('react-e/bind')(styles)

$('.foo', {
  className: {active: this.state.active}
})</pre></td>
  </tr>
  <tr>
    <th>react.createElement</th>
    <td><pre lang="javascript">
styles = require('./stylesheet.css')
classnames = require('classnames/bind')(styles)

createElement('div', {
  className: classnames('foo', {active: this.state.active})
})</pre></td>
  </tr>
  <tr>
    <th>JSX</th>
    <td><pre lang="jsx">
styles = require('./stylesheet.css')
classnames = require('classnames/bind')(styles)

&lt;div
  className={classnames('foo', {active: this.state.active})}
&gt;&lt;/div&gt;</pre></td>
  </tr>
</table>
**Also works on components that use the prop `className`:**
<table>
  <tr>
    <th>react-e</th>
    <td><pre lang="javascript">
styles = require('./stylesheet.css')
$ = require('react-e/bind')(styles)

$(Button, {
  className: ['foo', {active: this.state.active}]
})</pre></td>
  </tr>
  <tr>
    <th>react.createElement</th>
    <td><pre lang="javascript">
styles = require('./stylesheet.css')
classnames = require('classnames/bind')(styles)

createElement(Button, {
  className: classnames('foo', {active: this.state.active})
})</pre></td>
  </tr>
  <tr>
    <th>JSX</th>
    <td><pre lang="jsx">
styles = require('./stylesheet.css')
classnames = require('classnames/bind')(styles)

&lt;Button
  className={classnames('foo', {active: this.state.active})}
&gt;&lt;/Button&gt;</pre></td>
  </tr>
</table>
