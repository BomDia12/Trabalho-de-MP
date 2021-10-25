import {
  BottomPlayer,
  Container,
  YourPoints,
  LeftPlayer,
  RightPlayer,
  EnemyPoints,
  Table,
  TopPlayer,
  YourRound,
  EnemyRound
} from "./styles";
import CardBack from "../../components/GameCardBack";
import { useParams } from "react-router";
import { api } from "../../services/api";
import { useState, useEffect } from 'react'

const Game = () => {

  const [ round, setRound ] = useState({});
  const [game, setGame] = useState({})

  const { player, game_id } = useParams()

  const getRound = async () => {
    const response = await api.get(`/games/${game_id}`)

    setGame(response.data)
    setRound(response.data.rounds.filter(round => !round.ended)[0])
    
  }
  
  useEffect(() => {
    getRound();
  }, []);

  return (
    <Container>
      <Table>Truco</Table>

        <YourPoints>
            <span>Seus pontos</span>
            {game && 
                +player % 2 == 0 ? game.point_a : game.point_b
            }
        </YourPoints>

        <EnemyPoints>
            <span>Pontos do seu inimigo</span>
            {game && 
                +player % 2 == 0 ? game.point_b : game.point_a
            }
        </EnemyPoints>

        <YourRound>
            <span>Seus pontos esse round</span>
            {round && 
                +player % 2 == 0 ? round.points_a : round.points_b
            }
        </YourRound>

        <EnemyRound>
            <span>Pontos do seu inimigo esse round</span>
            {round && 
                +player % 2 == 0 ? round.points_b : round.points_a
            }
        </EnemyRound>

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
