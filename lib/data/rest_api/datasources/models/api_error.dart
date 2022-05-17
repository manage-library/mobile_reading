import 'package:dio/dio.dart';

class ApiError {
  int? _statusCode;
  bool? _status;
  String? _message;
  String? _context;
  ApiError({dynamic error}) {
    if (error != null) _handleError(error);
  }

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError()
      .._statusCode = json['statusCode'] as int
      .._status = json['status'] as bool
      .._message = json['message'] as String?
      .._context = json['context'] as String?;
  }

  _handleError(dynamic error) {
    if (error is DioError) {
      _statusCode = error.response?.statusCode;
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          _status = false;
          break;
        default:
          _status = false;
          break;
      }
    } else if (error is Error) {
      _status = false;
      print("Exception occured: $error stackTrace: ${error.stackTrace}");
    } else if (error is Exception) {
      _status = false;
      print("Exception occured: $error stackTrace: ${error.toString()}");
    } else {
      _status = false;
    }
  }

  bool? get status => _status;

  int? get statusCode => _statusCode;

  @override
  String toString() {
    return 'ApiError{_statusCode: $_statusCode, _status: $_status, _message: $_message, _context: $_context}';
  }
}
