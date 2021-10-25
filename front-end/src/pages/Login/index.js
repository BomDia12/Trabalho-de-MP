// Arquivo da página inicial
import { RegisterContainer, Box } from "./styles"

import PageName from '../../components/pageName'
import Header from '../../components/header'
import Input from '../../components/input'
import Button from "../../components/FormButton"
import arrow from '../../assets/arrowBack/arrow.png'
import naipe2 from '../../assets/naipes/naipe2.png'

import axios from 'axios';
import { useUserContext } from '../../context/user'
import { useState } from "react"




const Login = () => {

    const { login } = useUserContext()
    const [email,setEmail] = useState("");
    const [password,setPassword] = useState("")
    function handleLogin(e) {
        e.preventDefault();
        login(email,password);
     }
    
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
                <form onSubmit={handleLogin} className="middleContainer">
                    <div className="input">
                        <Input 
                            onChange={event => setEmail(event.target.value)}
                            label={"Email"} 
                            name={"email"} 
                            type={"text"}
                            id={"email"} 
                            />
                        <Input 
                            onChange={event => setPassword(event.target.value)}
                            label={"Senha"} 
                            name={"passwprd"} 
                            type={"password"}
                            id={"password"} />
                    </div>
                    <div className="button">
                        <Button 
                            label={"Entrar"}
                            id={"login"}
                            type={"submit"}/>
                    </div>
                    <div className="cadastro">
                        <span className="span-click"> Esqueci minha senha</span>
                    </div>

                    <div className="cadastro">
                        <span>Não possui conta?</span><span className="span-click"> Crie sua conta</span>
                    </div>
                </form>
                <div className="bottom">
                    <img className="botton-card" src={naipe2} alt="Naipe da carta"/>
                    <span>{7}</span>
                </div>

            </Box> 
        </RegisterContainer>
    )
}

export default Login
