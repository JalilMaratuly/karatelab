function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	hello_world_api_url: 'https://sandbox.api.service.nhs.uk/hello-world',
    spartan_base_url: 'http://54.156.66.212:8000/api',
    google_url: 'https://google.com'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}