import 'package:testapp/models/user_crendentials.dart';
import 'package:testapp/models/user_model.dart';

String loginEndpoint(UserCredentials credentials) {
  return 'https://gorest.co.in/public-api/users?email=${credentials.email}&access-token=zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd';
}

String registerEndpoint() {
  return 'https://gorest.co.in/public-api/users?access-token=zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd';
}

String updateEndpoint(User credentials) {
  return 'https://gorest.co.in/public-api/users/${credentials.id}?&access-token=zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd';
}

Map<String, String> getBasicHeaders() {
  return {
    'Content-Type': 'application/json',
    'Access-Token': 'zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd',
  };
}
