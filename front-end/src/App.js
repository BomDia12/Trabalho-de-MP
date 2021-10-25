import { BrowserRouter } from "react-router-dom";
import UserProvider from "./context/user";
import Routes from './Routes';
import { GlobalStyle } from "./styles/Global";

function App() {
  return (
    <BrowserRouter>
    <UserProvider>
      <GlobalStyle />
      <Routes />
    </UserProvider>
    </BrowserRouter>
  );
}

export default App;
