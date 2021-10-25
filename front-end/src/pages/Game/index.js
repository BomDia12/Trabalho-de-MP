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
  
    const[hand, setHand] = useState()

  const loadHand = async () => {
    const response = await api.get(`games/${game_id}`)
    const response2 = await api.get(`games/round/${response.data.rounds[response.data.rounds.length - 1].id}`)
    setHand(response2.data.hands.filter(hand => hand.player == player)[response2.data.hands.filter(hand => hand.player == player).length - 1])
  }

  const playCardA = async () => {
    const response = await api.post("games/play", {hand_id: hand.id, card: 'a'})
    console.log(response.status)
  }

  const playCardB = async () => {
    const response = await api.post("games/play", {hand_id: hand.id, card: 'b'})
    console.log(response.status)
  }

  const playCardC = async () => {
    const response = await api.post("games/play", {hand_id: hand.id, card: 'c'})
    console.log(response.status)
  }
  
  useEffect(() => {
    getRound();
    loadHand();
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
        {hand && <a onClick={playCardA}>{hand.card_a}</a>}
        {hand && <a onClick={playCardB}>{hand.card_b}</a>}
        {hand && <a onClick={playCardC}>{hand.card_c}</a>}
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
