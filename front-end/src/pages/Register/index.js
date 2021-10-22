// Arquivo da página inicial
import { RegisterContainer } from "./styles"

import PageName from '../../components/pageName'
import Header from '../../components/header'
import arrow from '../../assets/arrowBack/arrow.png'


const Register = () => {
    return (
        <RegisterContainer>
            <Header icon={arrow}/>
            <PageName 
                title= "Cadastro"
            />
        </RegisterContainer>
    )
}

export default Register
