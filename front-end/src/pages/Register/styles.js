
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

    .top {
        align-self: flex-start;
        margin-left: 1em;
        padding-top: 1em;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        flex-direction: column;
        
    }

    .top-card {
            display: flex;
            flex-direction: column;
            gap: 10px;
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
    }

    .bottom-card {
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        gap: 10px;

        img {
            width: 1.5rem;
        }
    }

    .button {
        background-color: #2B4614;
        color: #ffffff;
        padding-top: 5rem;
        width: 10rem;
        height: 5rem;
        border-radius: 10rem;
    }

    .span-click {
        color: #2B4614;
        font-weight: 600;
}
`;
