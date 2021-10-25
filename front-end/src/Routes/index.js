import React from 'react'
import { Switch, Route } from 'react-router'
import HomePage from '../pages/HomePage'
import UserProfile from '../pages/UserProfile'
import Rules from '../pages/GameRules'
import Game from '../pages/Game'
import InitGame from '../pages/InitGame'
import Register from '../pages/Register'
import Login from '../pages/Login'

const Routes = () => {
  return (
    <Switch>
      <Route exact path='/' component={HomePage} />
      <Route exact path='/rules' component={Rules} />
      <Route path='/user_perfil' component={UserProfile} />
      <Route path='/game/:game_id/:player' component={Game} />
      <Route path='/game_start' component={InitGame} />
      <Route exact path='/register' component={Register} />
      <Route exact path='/login' component={Login} />
    </Switch>
  )
}

export default Routes