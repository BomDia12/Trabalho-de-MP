
import styled from 'styled-components';

export const Container = styled.div`
    background-color: #FFFFFF;
    width: 350px;
    height: 50px;
    display: flex;
    justify-content: flex-start;
    flex-direction: column;
    align-self: center;
    margin-top: 1rem;

    input {
        font-size: 14px;
        width: 100%;
        height: 4em;    /* altura eh 3 vezes maior que a fonte do input */
        text-indent: 10px;
    }
    
`;