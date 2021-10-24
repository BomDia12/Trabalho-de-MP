// Arquivo da página inicial
import { FirstContainer, SecondContainer, TitleContainer } from './styles';
import Title from '../../components/Title'
import CardsImage from '../../assets/images/Rectangle.png'
import Tree from '../../assets/images/tree.png'
import Group from '../../assets/images/group.png'
import Ai from '../../assets/images/ai.png'
import Wagon from '../../assets/images/wagon.png'

import Button from '../../components/Button'

const HomePage = () => {
    return (
        <>
        <FirstContainer>
            <img src={CardsImage}></img>
            <TitleContainer>
                    <Title>O FUTURO DO TRUCO</Title>
            </TitleContainer>
            <Button>Jogue Agora</Button>
        </FirstContainer>

        <SecondContainer>
            <div className='content-wrapper'>
                <Title><span>Orientado a Testes</span></Title>
                <img src={Tree}></img>
                <p>Feito sob protocolo para uma melhor experiência</p>
            </div>
            <div className='content-wrapper-2'>
                <Title><span>Modo Multijogador</span></Title>
                <img src={Group}></img>
                <p>Jogue com seus amigos e divirta-se</p>
            </div>
            <div className='content-wrapper'>
                <Title><span>Truco Mineiro</span></Title>
                <img src={Wagon}></img>
                <p>Jogue a modalidade de truco queridinha do Brasil</p>
            </div>
            <div className='content-wrapper-2'>
                <Title><span>Inteligência Artificial</span></Title>
                <img src={Ai}></img>
                <p>Jogue contra o computador e teste suas habilidades</p>
            </div>

        </SecondContainer>
        </>
    );
}

export default HomePage
