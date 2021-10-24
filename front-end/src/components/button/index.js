import React from 'react'
import {Container} from './styles'

const Button = ({label}) => {
    return (
        <Container 
             type="button" id="login" value={label}
        />
    )
}

export default Button
