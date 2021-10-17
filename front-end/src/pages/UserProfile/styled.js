import styled from 'styled-components';

export const ContainerPrincipal = styled.div`
    background-color: #1D3557;
    width: 100vw;
    height: 100vh;
`;

export const ContainerBoxPerfil = styled.div`
    width: 100%;
    height: 100px;
    display: flex;
    justify-content: flex-start;
`;

export const BoxPerfil = styled.div`
    
    width: 50%;
    height: 100%;
    background-color: #2B4614;
    display: flex;
    align-items: center;
    justify-content: flex-start;
`;

export const TextBox = styled.span`
    font-style: normal;
    font-weight: normal;
    font-size: 64px;
    line-height: 86px;
    color: #fff;
    margin-left: 4rem;
`;

export const WrapperContainerUser = styled.div`
    width: 50%;
    margin: 2rem auto;
    background-color: #fff;
    border-radius: 8px;

    .padding-external-form {
        padding: 2rem;
    }

    span {
        font-style: normal;
        font-weight: bold;
        font-size: 36px;
        color: #1D3557;
    }
`;

export const FormContainer = styled.form`

    .wrapper-form-container {
        padding: 1rem 0;

        .txt_field {
            margin-bottom: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            
            
            input {
                width: 176px;
                height: 34px;
                border-radius: 50px;
                border: none;
                color: #fff;
            }
        }
        
        .div-line-botton {
            border-bottom: 1px solid #1D3557;
            width: 50%;
        }
    }

`;

export const SecondContainer = styled.div`
    margin: 2rem 0;

    .container-my-games {
        border-bottom: 1px solid #1D3557;
        display: flex;
        justify-content: center;
        align-items: center;

        .my-games-button {
            width: 214px;
            height: 42px;
            background: #FBB136;
            border: 1px solid #1D3557;
            box-sizing: border-box;
            border-radius: 50px;

            display: flex;
            justify-content: center;
            align-items: center;

            color: #1D3557;
            font-style: normal;
            font-weight: normal;
            font-size: 24px;

            margin-bottom: 2rem;
        }
    }
`;

export const ThirdContainer = styled.div`
    display: flex;
    justify-content: space-around;
`;