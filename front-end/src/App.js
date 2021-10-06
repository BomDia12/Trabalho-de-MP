import { BrowserRouter } from "react-router-dom";
import Routes from './Routes';
import { GlobalStyle } from "./styles/Global";

function App() {
  return (
    <BrowserRouter>
      <GlobalStyle />
      <Routes />
    </BrowserRouter>
  );
}

export default App;
