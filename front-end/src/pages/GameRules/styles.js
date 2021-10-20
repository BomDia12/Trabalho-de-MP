import styled from 'styled-components';

export const Container = styled.div`
padding: 2vh 10vw;
width: 100%;

  div {
    margin-bottom: 5vh;
    &:first-child { 
      padding-bottom: 10rem;
     }
  }

  p, li, th, td {
    font-size: 1.1rem;
    line-height: 1.4rem;
  }
  
  ul {
    padding-top: .5rem;
    margin-left: 3rem;
  }

`;

export const Table = styled.table`
  width: 60vw; 
  border-collapse: collapse; 
  margin: 50px auto;
  
  tr:nth-of-type(odd) { 
    background: #eee; 
    }

  th { 
    background: #1D3557; 
    color: white; 
    font-weight: bold; 
    }

  td, th { 
    padding: 10px; 
    border: 1px solid #ccc; 
    text-align: left; 
    font-size: 18px;
    }

  @media 
  only screen and (max-width: 760px), // Mobile responsivity
  (min-device-width: 768px) and (max-device-width: 1024px) { // ipads

    table { 
        width: 100%; 
    }

    /* Force table to not be like tables anymore */
    table, thead, tbody, th, td, tr { 
      display: block; 
    }
    
    /* Hide table headers (but not display: none;, for accessibility) */
    thead tr { 
      position: absolute;
    }
    
    tr { border: 1px solid #ccc; }
    
    td { 
      /* Behave  like a "row" */
      border: none;
      border-bottom: 1px solid #eee; 
      position: relative;
    }

    td:before { 
      /* Now like a table header */
      position: absolute;
      top: 6px;
      left: 6px;
      width: 45%; 
      padding-right: 10px; 
      white-space: nowrap;
      content: attr(data-column);

      color: #000;
      font-weight: bold;
    }
  }
`