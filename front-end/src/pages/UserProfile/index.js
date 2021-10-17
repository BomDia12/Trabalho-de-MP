import {
    ContainerPrincipal,
    ContainerBoxPerfil,
    BoxPerfil,
    TextBox,
    WrapperContainerUser,
    FormContainer,
    SecondContainer,
    ThirdContainer
} from './styled'

import Card from '../../components/cards'
import naipe1 from '../../assets/naipes/naipe1.png'
import naipe2 from '../../assets/naipes/naipe2.png'
import naipe3 from '../../assets/naipes/naipe3.png'

const UserProfile = () => {
    return (
        <ContainerPrincipal>
            <ContainerBoxPerfil>
                <BoxPerfil>
                    <TextBox>Meu <strong>Perfil</strong></TextBox>
                </BoxPerfil>
            </ContainerBoxPerfil>

            <WrapperContainerUser>
                <div className="padding-external-form">
                    <span>Dados Pessoais</span>
                    <FormContainer>
                        <div className="wrapper-form-container">
                            <div className="txt_field">
                                <label>Email</label>
                            </div>
                            <div className="div-line-botton"></div>
                            <div className="txt_field">
                                <label>Nome</label>
                                <input style={{backgroundColor: '#BA1200'}} type="button" value="Alterar Nome"/>
                            </div>
                            <div className="div-line-botton"></div>
                            <div className="txt_field">
                                <label>Senha</label>
                                <input style={{backgroundColor: '#2B4614'}} type="button" value="Alterar Senha"/>
                            </div>
                            <div className="div-line-botton"></div>
                        </div>
                    </FormContainer>

                    <SecondContainer>
                        <span>Dados do Jogo</span>
                        <div className="container-my-games">
                            <div className="my-games-button">Meus Jogos</div>
                        </div>
                    </SecondContainer>

                    <ThirdContainer>
                        <Card
                            imgNaipeCard={naipe1}
                            numberCard={4}
                            titleCard="Partidas Jogadas"
                            gameVariable="50"
                        />
                        <Card
                            imgNaipeCard={naipe2}
                            numberCard={7}
                            titleCard="Porcentagem de Vitorias"
                            gameVariable="50.00%"
                        />
                        <Card
                            imgNaipeCard={naipe3}
                            numberCard={4}
                            titleCard="Total de trucos pedidos"
                            gameVariable="50"
                        />
                    </ThirdContainer>
                </div>
            </WrapperContainerUser>
        </ContainerPrincipal>
    )
}

export default UserProfile
