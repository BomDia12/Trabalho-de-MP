import styled from 'styled-components';

export const ButtonContainer = styled.button`

    position: absolute;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 20%;
    padding: 1%;
    margin: 14% 0 10% 65%;
    font-size: 24px;
    text-transform: capitalize;
    background-color: #FBB136;
    color: #1D3557;
    border: 2px solid #1D3557;
    border-radius: 40px;
    z-index: 10;
    cursor: pointer;

    :hover {
        background-color: #1D3557;
        border: 2px solid #FBB136;
        color: #FBB136;
    }

    @media screen and (max-width: 1000px){
        font-size: 1.2rem;
    }
`;
