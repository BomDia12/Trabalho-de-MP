import {
  BottomPlayer,
  Container,
  LeftPlayer,
  RightPlayer,
  Table,
  TopPlayer,
} from "./styles";
import CardBack from "../../components/GameCardBack";
import { useParams } from "react-router";
import { api } from "../../services/api";
import { useState, useEffect } from 'react'

const Game = () => {

  const [ round, setRound ] = useState([]);

  const { player, game_id } = useParams()

  const getRound = async () => {
    const response = await api.get(`/games/${game_id}`)

    setRound(response.data.rounds.filter(round => !round.ended))
    
  }
  
  useEffect(() => {
    getRound();
  }, []);
  
  const showRound = (round) => {
    let pointsA, pointsB;

    for (let i = 0; i < round.length; i ++){
      pointsA = round[i].points_a
      pointsB = round[i].points_b
    }

    return `pontos A: ${pointsA}, pontos B: ${pointsB}`
  }

  return (
    <Container>
      <Table>Truco {showRound(round)}</Table>
      <TopPlayer>
        <CardBack />
        <CardBack />
        <CardBack />
      </TopPlayer>

      <RightPlayer>
        <CardBack />
        <CardBack />
        <CardBack />
      </RightPlayer>

      <BottomPlayer>
        <CardBack />
        <CardBack />
        <CardBack />
      </BottomPlayer>

      <LeftPlayer>
        <CardBack />
        <CardBack />
        <CardBack />
      </LeftPlayer>
    </Container>
  );
};

export default Game;
