
// import { /*faBiohazard,*/ faCoffee } from '@fortawesome/free-solid-svg-icons'
// import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import axios from 'axios'
import * as React from 'react'
import * as ReactGA from 'react-ga'
import { KeycloakProvider } from 'react-keycloak';
import { BrowserRouter as Router, Route/*, Link*/ } from "react-router-dom"
import { Stocks } from './Components/StocksTable'
// import Mailto from 'react-protected-mailto'
import { TopLevelNavBar } from './Components/TopLevelNavBar'
import { UserProfile } from './Components/UserProfile'
import { keycloak } from './keycloak'

import './App.css';

// import logo from './logo.png';
// import profilePic from './profile_pic_daedalusx.jpg'

ReactGA.initialize('UA-44196126-1');
ReactGA.pageview(window.location.pathname + window.location.search);

class App extends React.Component {
    public state = {
      userProfile: {
          firstName: "",
          lastName: "",
          username: ""
      }
    }
  
    public componentDidMount() {
      axios.get(`http://localhost:8081/user/dac3e982-7b26-4e90-9819-8dd059560b4b`)
        .then(res => {
          const userProfile = res.data;
          this.setState({ userProfile });
        })
    }

  public render() {
    return (
      <KeycloakProvider keycloak={keycloak}>
        <Router>
        <div className="App">
          <header className="App-header">
            <TopLevelNavBar />
          </header>
          {/* <div className="demo demo0" augmented-ui="tl-clip-x br-clip-x exe"/>
        <div className="demo demo1" augmented-ui="r-clip-x bl-clip-x exe"/> */}
          {/* <div className="demo demo2" augmented-ui="tl-clip tr-clip b-clip-x exe"/> */}
          {/* <img src={logo} className="App-logo" alt="logo" /> */}
          {/* <h1 className="App-title">Welcome to eGloo<FontAwesomeIcon icon={faCoffee} /></h1> */}
          {/* <UserProfile /> */}
          {/* <img src={profilePic} className="App-logo" alt="logo" /> */}
          
          {/* <p className="App-intro">
          For more information, please contact <Mailto
            email='info@egloo.com'
            headers={
              {subject:'Information on eGloo'}
          }/>
        </p> */}
          {/* <Route path="/stocks" component={Stocks} />
          <Route path={"/"+data.username} component={UserProfile} /> */}
          <Route path="/stocks" component={Stocks} />
          <Route path={"/"+this.state.userProfile.username} component={UserProfile} />
          
        </div>
        </Router>
      </KeycloakProvider>
    );
  }
}

export default App;
