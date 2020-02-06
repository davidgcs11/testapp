String loginEndpoint() {
  return 'https://gorest.co.in/public-api/users?first_name=john&access-token=zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd';
}

String registerEndpoint() {
  return 'https://gorest.co.in/public-api/users?access-token=zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd';
}

Map<String, String> getBasicHeaders() {
  return {
    'Content-Type': 'application/json',
    'Access-Token': 'zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd',
  };
}
