import * as React from 'react';
import * as ReactDOM from 'react-dom';
import App from './App';
import './index.css';
import { initOptions, keycloak } from './keycloak'
import registerServiceWorker from './registerServiceWorker';

keycloak.init({ onLoad: initOptions.onLoad }).success((auth: any) => {

  if (!auth) {
      window.location.reload();
  } else {
      // console.info("Authenticated");
  }

  // React Render
  ReactDOM.render(
    <App />,
    document.getElementById('root') as HTMLElement
  );
  
  localStorage.setItem("react-token", keycloak.token);
  localStorage.setItem("react-refresh-token", keycloak.refreshToken);
}).error(() => {
  // console.error("Authenticated Failed");
});

registerServiceWorker();
