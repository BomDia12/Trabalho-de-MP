import React from 'react'
import { Switch, Route } from 'react-router'
import HomePage from '../pages/HomePage'
import Rules from '../pages/GameRules'

const Routes = () => {
  return (
    <Switch>
      <Route exact path='/' component={HomePage} />
      <Route exact path='/rules' component={Rules} />
    </Switch>
  )
}

export default Routes