import { createGlobalStyle } from "styled-components";

export const GlobalStyle = createGlobalStyle`
    :root {
        --army-green: #2B4614;
        --black: #000000;
        --bright-yellow-crayola: #FBB13C;
        --international-orange: #BA1200;
        --prussian-blue: #1D3557;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
`;
