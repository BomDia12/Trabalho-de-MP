import React from 'react'
import {Container} from './styled'

const Card = ({numberCard, titleCard, gameVariable, imgNaipeCard}) => {
    return (
        <Container> 
            <div className="wrapper-content">
                <div className="top-card">
                    <span>{numberCard}</span>
                    <img src={imgNaipeCard} />
                </div>
                <div className="content-card">
                    <span className="span-text">{titleCard}</span>
                    <span className="span-number">{gameVariable}</span>
                </div>
                <div className="bottom-card">
                    <div className="div-naipe">
                        <img src={imgNaipeCard} />
                        <span>{numberCard}</span>
                    </div>
                </div>
            </div>
        </Container>
    )
}

export default Card
