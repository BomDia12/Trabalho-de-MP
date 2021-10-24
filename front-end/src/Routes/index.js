import React from 'react'
import { Switch, Route } from 'react-router'
import HomePage from '../pages/HomePage'
import UserProfile from '../pages/UserProfile'
import Rules from '../pages/GameRules'
import Register from '../pages/Register'
import Login from '../pages/Login'

const Routes = () => {
  return (
    <Switch>
      <Route exact path='/' component={HomePage} />
      <Route path='/user_perfil' component={UserProfile} />
      <Route exact path='/rules' component={Rules} />
      <Route exact path='/register' component={Register} />
      <Route exact path='/login' component={Login} />
    </Switch>
  )
}

export default Routes