import React from 'react'
import {Container} from './styles'

const Input = ({label,name,type,id, onChange}) => {
    return (
        <Container> 
            <label htmlFor={id}>{label}</label>
            <input name={name} type={type} id={id} onChange={onChange}/>
        </Container>
    )
}

export default Input
