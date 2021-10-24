// Arquivo da página inicial
import { RegisterContainer, Box } from "./styles"

import PageName from '../../components/pageName'
import Header from '../../components/header'
import Input from '../../components/input'
import Button from "../../components/button"
import arrow from '../../assets/arrowBack/arrow.png'
import naipe2 from '../../assets/naipes/naipe2.png'


const Register = () => {
    return (
        <RegisterContainer>
            <Header icon={arrow}/>
            <PageName 
                title= "Cadastro"
            />
            <Box> 
                <div className="top">
                    <span>{7}</span>
                    <img className="top-card" src={naipe2} alt="Naipe da carta"/>
                </div>
                <Input 
                    label={"Nome"} 
                    name={"username"} 
                    type={"text"}
                    id={"name"} />
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
                <Input 
                    label={"Confirme sua senha"} 
                    name={"passwprd_confirmation"} 
                    type={"password"}
                    id={"password_confirmation"} />

                <Button label={"Entrar"}/>
                <div>
          <         span>Já possui conta?</span><span className="span-click"> Faça login</span>
                </div>

                <div className="bottom">
                    <img className="botton-card" src={naipe2} alt="Naipe da carta"/>
                    <span>{7}</span>
                </div>

            </Box> 
        </RegisterContainer>
    )
}

export default Register
