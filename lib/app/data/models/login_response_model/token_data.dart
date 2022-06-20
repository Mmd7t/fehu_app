class TokenData {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  TokenData({this.accessToken, this.tokenType, this.expiresIn});

  factory TokenData.fromJson(Map<String, dynamic> json) => TokenData(
        accessToken: json['access_token'] as String?,
        tokenType: json['token_type'] as String?,
        expiresIn: json['expires_in'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'token_type': tokenType,
        'expires_in': expiresIn,
      };
}
