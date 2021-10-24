// Arquivo de estilos da página inicial

import styled from 'styled-components';

export const FirstContainer = styled.section`
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 40%;
    padding: 0 0 0 0%;

    /*.img-wrapper {

        img {
            object-fit: cover;
            width: 100%;
            height: 100%;
            padding-top: 0%;
            padding-bottom: 0%
        }
    };*/
`
export const TitleContainer = styled.section`
    position: absolute;
    display: flex;
    width: 40%;
    background-color: #BA1200;
    text-align: left;
    align-items: center;
    padding: 1% 1% 1% 5%;
    margin: 10% 0 10% 0;
    z-index: 10;
`
export const SecondContainer = styled.section`
    display: flex;
    width: 100%;
    height: auto;
    padding: 5% 10% 0 10%;
    align-items: center;
    background-color: #2B4614;
    flex-direction: row;

    img {
        padding: 6%;
    }

    .content-wrapper {
        padding: 3%;
        max-width: 40%;
        height: 50vh;
        margin-left: 20px;
        margin-right: 20px;
        margin-bottom: 10%;
        text-align: center;
        background-color: white;
        border-radius: 15px;

        p {
            color: black;
            margin-top: 3%;
            line-height: 1.6rem;
            font-size: 1.2rem;
        };
    }

    .content-wrapper-2 {
        padding: 3%;
        max-width: 40%;
        height: 50vh;
        margin-left: 20px;
        margin-right: 20px;
        margin-bottom: 10%;
        text-align: center;
        background-color: white;
        border-radius: 15px;

        p {
            color: black;
            margin-top: 3%;
            line-height: 1.6rem;
            font-size: 1.2rem;
        };
    }

`