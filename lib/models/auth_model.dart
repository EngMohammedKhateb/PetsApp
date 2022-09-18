import 'user.dart';

class AuthModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  User? user;

  AuthModel({this.accessToken, this.tokenType, this.expiresIn, this.user});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        accessToken: json['access_token'] as String?,
        tokenType: json['token_type'] as String?,
        expiresIn: json['expires_in'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'token_type': tokenType,
        'expires_in': expiresIn,
        'user': user?.toJson(),
      };
}
