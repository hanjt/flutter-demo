class BaseResponse {
  final int errorCode;
  final String errorMsg;
    
  BaseResponse({
    this.errorCode,
    this.errorMsg,
  });
  factory BaseResponse.fromJson(Map<String, dynamic> json) {
      return BaseResponse(
        errorCode: json['error_code'],
        errorMsg: json['error_msg'],
      );
    }
}