import * as Keycloak from 'keycloak-js';

const url = process.env.NODE_ENV === 'development' ? 'http://localhost:8080/auth' : 'https://keycloak.egloo.com/auth'

export const initOptions = {
  clientId: 'egloo-react-web',
  onLoad: 'login-required',
//   onLoad: 'check-sso',
  realm: 'egloo', 
  silentCheckSsoRedirectUri: window.location.origin,
  url,
}

// Setup Keycloak instance as needed
// note formatting: fix for ts-lint w/ implicit any on new
// 'new' expression, whose target lacks a construct signature, implicitly has an 'any' type.ts(7009)
export const keycloak = new (Keycloak as any)(initOptions);
