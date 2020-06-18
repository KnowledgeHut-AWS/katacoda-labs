
## Summarising

Here's what the final package.json shall look like

```json
{
  "name": "babelingit",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "type-check": "tsc --noEmit",
    "type-check:watch": "npm run type-check -- --watch",
    "build:types": "tsc --emitDeclarationOnly",
    "build:js": "webpack --mode=development",
    "build": "npm run build:types && npm run build:js"
  },
  "keywords": [],
  "author": "Rocket Racoon <rocket.racoon@guardians.com> (https://www.guardians.com)",
  "license": "ISC",
  "devDependencies": {
    "@babel/core": "^7.10.2",
    "@babel/plugin-proposal-class-properties": "^7.10.1",
    "@babel/plugin-proposal-object-rest-spread": "^7.10.1",
    "@babel/preset-env": "^7.10.2",
    "@babel/preset-flow": "^7.10.1",
    "@babel/preset-typescript": "^7.10.1",
    "babel-loader": "^8.1.0",
    "fork-ts-checker-webpack-plugin": "^5.0.1",
    "typescript": "^3.9.5",
    "webpack": "^4.43.0",
    "webpack-cli": "^3.3.11"
  }
}
