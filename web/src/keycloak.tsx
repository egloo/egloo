import * as Keycloak from 'keycloak-js';

// keycloak init options
export const initOptions = {
  clientId: 'egloo-react-web',
  onLoad: 'login-required',
//   onLoad: 'check-sso',
  realm: 'egloo', 
  silentCheckSsoRedirectUri: window.location.origin,
  url: 'http://localhost:8080/auth',
}

// Setup Keycloak instance as needed
// note formatting: fix for ts-lint w/ implicit any on new
// 'new' expression, whose target lacks a construct signature, implicitly has an 'any' type.ts(7009)
export const keycloak = new (Keycloak as any)(initOptions);
