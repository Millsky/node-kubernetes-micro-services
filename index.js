const express = require('express');
const keycloakConnect = require('keycloak-connect');
const session = require('express-session');
const redisStore = require('connect-redis')(session);

const app = express();

/* Setup the store */
const store = new redisStore({
  host: process.env.REDIS_HOST,
  port: process.env.REDIS_PORT,
  password: process.env.REDIS_PASSWORD,
});

/* Set up the koa-app to use the redis store */
app.use(session({
  secret: 'mySecret',
  store,
}));

app.use((req, resp, next) => {
  next();
});

/* set-up keycloak to use the redis-store */
const keycloak = new keycloakConnect({
  store,
});

app.use(keycloak.middleware());

const pets = function (req, res) {
  res.json({
    result: JSON.stringify(JSON.parse(req.session['keycloak-token']), null, 4),
    event: '1. Authentication\n2. Login'
  });
};


app.get('/auth/pets', keycloak.protect(), pets);

app.listen(8060);
