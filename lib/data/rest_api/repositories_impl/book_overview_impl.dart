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
  Future<int?> addRate(int bookId, BookRatingModel rate) async {
    try {
      var response = await _restClient.postMethod(sprintf(ApiConfig.addNewComment, [bookId]), data: rate.toJson());
      print("response add rate : ${response.data['statusCode']}");
      return response.data['statusCode'];
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse rate.error: ${apiResponse.error.toString()}');
    }
    return null;
  }

  @override
  Future<Comment?> addComment(int bookId, BookRatingModel rate) async {
    try {
      var response = await _restClient.postMethod(sprintf(ApiConfig.getComment, [bookId]), data: rate.toJson());
      print("response comment : ${response.toString()}");
      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) =>
              ApiResultSingle<Comment>(json: json, jsonConverter: (json) => Comment.fromJson(json))).result?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('api post comment : ${apiResponse.error}');
    }
    return null;
  }
  
  @override
  Future<Comment?> deleteComment(int bookId, int commentId) async {
    try {
      var response = await _restClient.deleteMethod(sprintf(ApiConfig.deleteCommentById, [bookId, commentId]), params: {});
    print("response delete comment : ${response.toString()}");
      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) =>
              ApiResultSingle<Comment>(json: json, jsonConverter: (json) => Comment.fromJson(json))).result?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('api delete comment : ${apiResponse.error}');
    }
    return null;
  }

  
}
