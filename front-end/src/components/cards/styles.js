import styled from 'styled-components';

export const Container = styled.div`
    background: #FFFFFF;
    border: 1px solid var(--black);
    box-sizing: border-box;
    border-radius: 10px;
    width: 250px;
    height: 350px;

    .wrapper-content {
        padding: 0.5rem;
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;

        .top-card {
            display: flex;
            flex-direction: column;
            gap: 10px;
            justify-content: flex-start;

            img {
                width: 1.5rem;
            }
        }

        .content-card {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 25px 10px;

            .span-text {
                font-style: normal;
                font-weight: normal;
                font-size: 24px;
                line-height: 32px;
                text-align: center;

                color: var(--prussian-blue);
            }

            .span-number {
                font-weight: normal;
                font-size: 48px;
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
    }
`;