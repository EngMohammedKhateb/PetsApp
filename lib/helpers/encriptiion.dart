import 'dart:convert';

class Encriptor {
  Codec<String, String> stringToBase64;

  Encriptor() : stringToBase64 = utf8.fuse(base64);

  fromBase64(String credentials) {
    String decoded = stringToBase64.decode(credentials);
    return decoded;
  }

  toBase64(String credentials) {
    String encoded = stringToBase64.encode(credentials);
    return encoded;
  }
  // dXNlcm5hbWU6cGFzc3dvcmQ=

}
