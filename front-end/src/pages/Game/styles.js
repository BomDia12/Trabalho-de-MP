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
  position: relative;
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

export const TopPlayer = styled.div`
  position: absolute;
  top: 10px;
  display: flex;
  transform: rotate(180deg);
`;

export const RightPlayer = styled.div`
  position: absolute;
  right: -50px;
  display: flex;
  transform: rotate(-90deg);
`;

export const BottomPlayer = styled.div`
  position: absolute;
  bottom: 10px;
  display: flex;
  a {
    margin: 5px;
    cursor: pointer;
  }
`;

export const LeftPlayer = styled.div`
  position: absolute;
  left: -50px;
  display: flex;
  transform: rotate(90deg);
`;

const PointShow = styled.div`
    position: absolute;
    height: 6rem;
    width: 15rem;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.5rem;
    color: #fbb13c;
    text-shadow: 0 0 5px #000;
    flex-direction: column;
    text-align: center;
`;

export const YourPoints = styled(PointShow)`
    left: 5vw;
    top: 5vh;
`;

export const EnemyPoints = styled(PointShow)`
    right: 5vw;
    top: 5vh;
`;

export const YourRound = styled(PointShow)`
    left: 5vw;
    bottom: 5vh;
`;

export const EnemyRound = styled(PointShow)`
    right: 5vw;
    bottom: 5vh;
`;
