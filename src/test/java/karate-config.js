function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    apiUrl: 'https://api.realworld.io/api/'

  }
  if (env == 'dev') {
    config.userName = 'udemytest@test.com'
    config.userPassword = 'udemytest'

  } else if (env == 'qa') {
    config.userName = 'udemytest@test.com'
    config.userPassword = 'udemytest'
  }

  var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature', config).authToken
  karate.configure('headers', {Authorization: 'Token ' + accessToken})

  return config;
}