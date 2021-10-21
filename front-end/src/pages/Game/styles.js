import styled from "styled-components";

export const Container = styled.div`
  background: var(--international-orange);
  width: 100vw;
  height: 100vh;

  display: flex;
  justify-content: center;
  align-items: center;
`;

export const Table = styled.div`
  background: radial-gradient(
    50% 50% at 50% 50%,
    #406c1b 0%,
    var(--army-green) 100%
  );
  border: solid 5px var(--bright-yellow-crayola);
  width: 90vw;
  height: 90vh;

  display: flex;
  justify-content: center;
  align-items: center;

  font-family: "Cinzel", serif;
  font-size: 4rem;
  color: white;
`;
