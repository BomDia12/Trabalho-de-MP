import React from 'react'
import { Switch, Route } from 'react-router'
import HomePage from '../pages/HomePage'
import UserProfile from '../pages/UserProfile'
import Rules from '../pages/GameRules'
import Game from '../pages/Game'

const Routes = () => {
  return (
    <Switch>
      <Route exact path='/' component={HomePage} />
      <Route exact path='/rules' component={Rules} />
      <Route path='/user_perfil' component={UserProfile} />
      <Route exact path='/game/:game_id/:player' component={Game} />
    </Switch>
  )
}

export default Routes