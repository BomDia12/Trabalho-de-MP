import {useState} from "react"
// Arquivo da página inicial
import { RegisterContainer, Box } from "./styles"

import PageName from '../../components/pageName'
import Header from '../../components/header'
import Input from '../../components/input'
import Button from "../../components/FormButton"
import arrow from '../../assets/arrowBack/arrow.png'
import naipe2 from '../../assets/naipes/naipe2.png'
import { useUserContext } from "../../context/user"


const Register = () => {

    const { register } = useUserContext();
    const [name,setName] = useState("");
    const [email,setEmail] = useState("");
    const [password,setPassword] = useState("")
    function handleRegister(e) {
        e.preventDefault();
        register(name,email,password);
     }

    return (
        <RegisterContainer>
            <Header icon={arrow}/>
            <PageName 
                title= "Cadastro"
            />
            <Box onSubmit={handleRegister}> 
                <div className="top">
                    <span>{7}</span>
                    <img className="top-card" src={naipe2} alt="Naipe da carta"/>
                </div>
                <Input 
                    label={"Nome"} 
                    name={"username"} 
                    type={"text"}
                    id={"name"}
                    onChange={event => setName(event.target.value)} 
                    />
                <Input 
                    label={"Email"} 
                    name={"email"} 
                    type={"text"}
                    id={"email"} 
                    onChange={event => setEmail(event.target.value)} 
                    />
                <Input 
                    label={"Senha"} 
                    name={"passwprd"} 
                    type={"password"}
                    id={"password"} 
                    onChange={event => setPassword(event.target.value)} 
                    />
                <Input 
                    label={"Confirme sua senha"} 
                    name={"passwprd_confirmation"} 
                    type={"password"}
                    id={"password_confirmation"} 
                    />

                <Button 
                    label={"Cadastrar"}
                    id={"register"}
                    type={"submit"}/>
                
                <div className="register">
                    <span>Já possui conta?</span><span className="span-click"> Faça login</span>
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
