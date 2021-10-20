import React from 'react'
import { Switch, Route } from 'react-router'
import HomePage from '../pages/HomePage'
import Rules from '../pages/GameRules'
import Register from '../pages/Register'

const Routes = () => {
  return (
    <Switch>
      <Route exact path='/' component={HomePage} />
      <Route exact path='/rules' component={Rules} />
      <Route exact path='/register' component={Register} />
    </Switch>
  )
}

export default Routes