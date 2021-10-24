import styled from 'styled-components';

export const StyleTitle = styled.title`
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    font-size: 4.5rem;
    font-weight: bold;
    color: white;

    span {
        font-size: 2rem;
        color: #1D3557;

        @media screen and (max-width: 1400px){
            font-size: 1.2rem;
        }
    }

    @media screen and (max-width: 1400px){
        font-size: 3rem;
    }

    @media screen and (max-width: 1000px){
        font-size: 1.4rem;
    }
`