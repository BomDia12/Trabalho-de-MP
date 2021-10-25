
import styled from 'styled-components';

export const RegisterContainer = styled.div`
    background-color: #1D3557;
    height: 100vh;
    display: flex;
    justify-content: flex-start;
    flex-direction: column;

`;

export const Box = styled.div`
    background-color: #ffffff;
    width: 25rem;
    height: 30rem;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    align-self: center;
    flex-direction: column;
    border-radius: 1rem;
    margin-top: 1rem;

    .top {
        align-self: flex-start;
        margin-left: 1em;
        padding-top: 1em;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        flex-direction: column;
        height: 10%;
        
    }

    .top-card {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            justify-content: flex-start;

            img {
                width: 1.5rem;
            }
        }
    
    .bottom {
        align-self: flex-end;
        margin-right: 1em;
        padding-bottom: 1em;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        flex-direction: column;
        height: 10%;
    }

    .bottom-card {
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        gap: 1rem;

        img {
            width: 1.5rem;
        }
    }
    .middleContainer{
        height: 80%;
        align-items: center;
        justify-content: center;
        display: flex;
        flex-direction: column;

    }
    .button {
        margin-top: 2rem;
        align-self: center;
    }
    .input {
        margin-top: 3rem;
    }
    .cadastro {
        margin-top: 1rem;
    }
    .span-click {
        color: #2B4614;
        font-weight: 600;
}
`;
