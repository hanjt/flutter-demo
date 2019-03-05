class LoginResponse {
  final int errorCode;
  final String errorMsg;
  final String uid;
    
  const LoginResponse({
    this.errorCode,
    this.errorMsg,
    this.uid,
  });
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
      return LoginResponse(
        errorCode: json['error_code'],
        errorMsg: json['error_msg'],
        uid: json['data'] != null ? (json['data']['uid'] ?? '') : '',
      );
    }
}