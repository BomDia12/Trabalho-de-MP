import React from 'react'
import {Container} from './styles'

const Button = ({label, id}) => {
    return (
        <Container 
             type="button" id={id} value={label}
        />
    )
}

export default Button
