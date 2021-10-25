// Arquivo da página inicial
import { RegisterContainer, Box } from "./styles"

import PageName from '../../components/pageName'
import Header from '../../components/header'
import Input from '../../components/input'
import Button from "../../components/FormButton"
import arrow from '../../assets/arrowBack/arrow.png'
import naipe2 from '../../assets/naipes/naipe2.png'


const Login = () => {
    return (
        <RegisterContainer>
            <Header icon={arrow}/>
            <PageName 
                title= "Login"
            />
            <Box> 
                <div className="top">
                    <span>{7}</span>
                    <img className="top-card" src={naipe2} alt="Naipe da carta"/>
                </div>
                <div className="middleContainer">
                    <div className="input">
                        <Input 
                            label={"Email"} 
                            name={"email"} 
                            type={"text"}
                            id={"email"} />
                        <Input 
                            label={"Senha"} 
                            name={"passwprd"} 
                            type={"password"}
                            id={"password"} />
                    </div>
                    <div className="button">
                        <Button 
                            label={"Entrar"}
                            id={"login"}/>
                    </div>
                    <div className="cadastro">
                        <span className="span-click"> Esqueci minha senha</span>
                    </div>

                    <div className="cadastro">
                        <span>Não possui conta?</span><span className="span-click"> Crie sua conta</span>
                    </div>
                </div>
                <div className="bottom">
                    <img className="botton-card" src={naipe2} alt="Naipe da carta"/>
                    <span>{7}</span>
                </div>

            </Box> 
        </RegisterContainer>
    )
}

export default Login
