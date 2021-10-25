import React from 'react'
import {Container, Image} from './styles'

const Header = ({icon}) => {
    return (
        <Container> 
            <Image src={icon} alt="Voltar"/>
        </Container>
    )
}

export default Header
