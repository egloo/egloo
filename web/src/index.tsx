import * as React from 'react';
import * as ReactDOM from 'react-dom';
import App from './App';
import './index.css';
import { initOptions, keycloak } from './keycloak'
import registerServiceWorker from './registerServiceWorker';

// tslint:disable: variable-name
class KeycloakUserInfo {
  public sub: string
  public email_verified: boolean
  public name: string
  public preferred_username: string
  public given_name: string
  public family_name: string
  public email: string
}
// tslint:enable: variable-name

keycloak.init({ onLoad: initOptions.onLoad, promiseType: 'native' }).then((auth: any) => {

  if (!auth) {
    window.location.reload();
  } else {
    // console.info("Authenticated");
  }

  localStorage.setItem("react-token", keycloak.token);
  localStorage.setItem("react-refresh-token", keycloak.refreshToken);
  keycloak.loadUserInfo().then((userInfo: KeycloakUserInfo) => {
    localStorage.setItem("userId", userInfo.sub)
    // React Render
    ReactDOM.render(
      <App />,
      document.getElementById('root') as HTMLElement
    );

  }).catch(() => {
    // tslint:disable-next-line:no-console
    console.error('Failed to load user info');
  });


}).catch(() => {
  // console.error("Authenticated Failed");
});

registerServiceWorker();
