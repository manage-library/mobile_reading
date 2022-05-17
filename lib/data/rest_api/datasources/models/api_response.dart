import 'package:book_reading_mobile_app/data/rest_api/datasources/models/api_result.dart';

import '../../../../domain/entities/user.dart';
import 'api_error.dart';

class ApiResponse<T> {
  bool? _status;
  int? _statusCode;
  ApiResult<T>? _result;
  ApiError? _error;

  bool get hasData => _result?.data != null;

  bool get hasError => _error != null;

  bool get isSucceeded => _status != null && _status == true;

  bool get isFailed => _status == null || _status == false;

  bool get hasMessage => _statusCode == 201;

  ApiResponse();

  factory ApiResponse.withResult(
      {Map<String, dynamic>? response,
      ApiResult Function(dynamic json)? resultConverter,}) {
    bool status = response!['status'] as bool;
    if (status) {
      return ApiResponse()
        .._status = status
        .._result = (resultConverter != null
            ? resultConverter(response['data'])
            : null) as ApiResult<T>?;
    }
    else {
      return ApiResponse()
          .._status = status
          .._error = ApiError.fromJson(response);
    }
  }

  factory ApiResponse.withError(dynamic error) {
    return ApiResponse()
      .._status = false
      .._error = ApiError(error: error);
  }

  factory ApiResponse.catchError({Map<String, dynamic>? response}) {
    return ApiResponse()
        .._status = response!['status'] as bool
        .._error = ApiError.fromJson(response);
  }

  ApiResult<T>? get result => _result;

  ApiError? get error => _error;
}
