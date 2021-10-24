import { createContext, useContext, useState } from "react";

const UserContext = createContext()

const UserProvider = ({ children }) => {

    const [user, setUser] = useState(nil)

    return (
        <UserContext.Provider value={{user}}>
            {children}
        </UserContext.Provider>
    )
}

export const useUserContext = () => {
    return useContext(UserContext)
}

export default UserProvider
