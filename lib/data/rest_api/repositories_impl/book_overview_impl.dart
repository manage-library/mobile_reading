import 'package:book_reading_mobile_app/configs/api_config.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/models/api_response.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/models/api_result.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/rest_client.dart';
import 'package:book_reading_mobile_app/domain/entities/comment.dart';
import 'package:book_reading_mobile_app/domain/entities/rate.dart';
import 'package:sprintf/sprintf.dart';

import '../../../domain/repositories/overview_book_repository.dart';

class BookOverViewImpl extends BookOverViewRepository {
  final RestClient _restClient = RestClient();
  @override
  Future<List<Comment?>> getComment(int bookId) async {
    try {
      var response = await _restClient.getMethod(sprintf(ApiConfig.getComment, [bookId]), params: {});
      print("response comment : $response");
      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) =>
              ApiResultList<Comment>(json: json, jsonConverter: (json) => Comment.fromJson(json))).result?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('api list comment : ${apiResponse.error}');
    }
    return [];
  }

  @override
  Future<int?> addNewComment(int bookId, BookRatingModel rate) async {
    try {
      var response = await _restClient.postMethod(sprintf(ApiConfig.addNewComment, [bookId]), data: rate);
      print("response add comment : ${response.data['statusCode']}");
      return response.data['statusCode'];
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse updateInfor .error: ${apiResponse.error.toString()}');
    }
    return null;
  }
}
