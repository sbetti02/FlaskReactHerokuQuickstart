import { useEffect, useState } from 'react';

import './App.css';

function App() {

  const [apiData, setApiData] = useState();

  useEffect(() => {
    let urlBase = 'http://localhost:5000';
    let url = `${urlBase}/healthcheck`;
    fetch(url)
      .then((res => res.json()))
      .catch(err => console.log(err))
      .then(data => {
        setApiData(data);
      });
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <p>
          Saying hello from API!
        </p>
        <p>
          { apiData ? JSON.stringify(apiData) : "Oh no! something went wrong :(" }
        </p>
      </header>
    </div>
  );
}

export default App;
