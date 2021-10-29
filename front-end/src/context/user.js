import { createContext, useContext, useState } from "react";
import {api} from '../services/api';

const UserContext = createContext()

const UserProvider = ({ children }) => {

    const [user, setUser] = useState(null)

    async function login(email,password) {
        const response = await api.post('/user/login', {
          email: email,
          password: password,
        });
     
        setUser(response.data)
        console.log(response.data)
    }
    
    async function register(name,email,password) {
        const response = await api.post('/user/register', {
            name: name,
            email: email,
            password: password,
        });
     
        setUser(response.data)
        console.log(response.data)
    }

    return (
        <UserContext.Provider value={{user, login, register}}>
            {children}
        </UserContext.Provider>
    )
}

export const useUserContext = () => {
    return useContext(UserContext)
}

export default UserProvider
