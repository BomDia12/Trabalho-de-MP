
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
    width: 500px;
    height: 600px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    align-self: center;
    flex-direction: column;
    border-radius: 8px;

    .top-card {
            display: flex;
            flex-direction: column;
            gap: 10px;
            justify-content: flex-start;

            img {
                width: 1.5rem;
            }
        }

    .bottom-card {
        display: flex;
        justify-content: flex-end;
        
        .div-naipe {
            bottom: 0;
            display: flex;
            gap: 10px;
            flex-direction: column;
        }

        img {
            width: 1.5rem;
        }
    }
    .button {
        background-color: #2B4614;
        color: #ffffff;
        width: 5rem;
        height: 2rem;
        border-radius: 30px;
    }
    .span-click {
        color: #2B4614;
        font-weight: 600;
}
`;
