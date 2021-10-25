import React from 'react'
import {Container} from './styles'

const Button = ({label, id, type}) => {
    return (
        <Container 
             type={type} id={id} value={label}
        />
    )
}

export default Button
