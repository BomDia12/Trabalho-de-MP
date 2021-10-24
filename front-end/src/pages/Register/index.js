// Arquivo da página inicial
import { RegisterContainer, Box } from "./styles"

import PageName from '../../components/pageName'
import Header from '../../components/header'
import Input from '../../components/input'
// import Button from "../../components/button"
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
                <span>{7}</span>
                <img className="top-card" src={naipe2} alt="Naipe da carta"/>
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

                {/* <Button/> */}
                <input class="button" type="button" id="login" value="entrar"/>

                <div>
          <         span>Já possui conta?</span><span className="span-click"> Faça login</span>
                </div>

                <div className="div-naipe">
                    <img className="botton-card" src={naipe2} alt="Naipe da carta"/>
                </div>
                <span>{7}</span>

            </Box> 
        </RegisterContainer>
    )
}

export default Register
