import 'package:book_reading_mobile_app/configs/api_config.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/models/api_response.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/models/api_result.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/rest_client.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/chapter.dart';
import 'package:book_reading_mobile_app/domain/repositories/detail_book_repository.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/filter_screen.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:sprintf/sprintf.dart';

class DetailBookImpl extends DetailBookRepository {
  final RestClient _restClient = RestClient();
  @override
  Future<Book?> getBookById({String? id}) async {
    try {
      var response = await _restClient.getMethod(sprintf(ApiConfig.getBookById, [id]), params: {});
      print('response : $response');
      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) => ApiResultSingle<Book>(
                json: json,
                jsonConverter: (json) => Book.fromJson(json),
              )).result?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse.error : ${apiResponse.error}');
    }
    return null;
  }

  @override
  Future<List<Book?>> getBooks({bool? isVip, int? sortBy, String? sortType, int? categoryId, String? bookName, String? authorName}) async {
    var response;
    try {
      if (isVip == null && sortBy == null && sortType == null) {
        response = await _restClient.getMethod(ApiConfig.getBooks, params: {});
      } else {
        response = await _restClient.getMethod(ApiConfig.getBooks,
            params: {'isVip': isVip, 'sortBy': sortBy, 'sortType': sortType, 'categoryId': categoryId});
      }
      if (categoryId != null) {
        response = await _restClient.getMethod(ApiConfig.getBooks, params: {'categoryId': categoryId});
      }

      if(bookName != null) {
        response = await _restClient.getMethod(ApiConfig.getBooks, params: {'bookName' : bookName});
      }

      if(authorName != null) {
        response = await _restClient.getMethod(ApiConfig.getBooks, params: {'authorName' : authorName});
      }
      
      print("responseBookList : $response");
      return ApiResponse.withResult(
              response: response.data,
              resultConverter: (json) => ApiResultList<Book>(json: json, jsonConverter: (json) => Book.fromJson(json)))
          .result
          ?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponseBookList.error : ${apiResponse.error}');
    }
    return [];
  }

  @override
  Future<Chapter?> getContentByChapter({String? chapterId, String? bookId}) async {
    try {
      print(sprintf(ApiConfig.getChapterById, [bookId, chapterId]));

      var response = await _restClient.getMethod(sprintf(ApiConfig.getChapterById, [bookId, chapterId]), params: {});

      print('responseChapterList : $response');
      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) => ApiResultSingle<Chapter>(
                json: json,
                jsonConverter: (json) => Chapter.fromJson(json),
              )).result?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponseChapterList.error : ${apiResponse.error}');
    }
    return null;
  }

  @override
  Future<List<Book?>> getBookFilter({FilterParam? filterParam}) async {
    try {
      var response = await _restClient.getMethod(ApiConfig.getBooks, params: filterParam?.buildParams() ?? {});
      print("responseBookList : $response");
      return ApiResponse.withResult(
              response: response.data,
              resultConverter: (json) => ApiResultList<Book>(json: json, jsonConverter: (json) => Book.fromJson(json)))
          .result
          ?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponseBookList.error : ${apiResponse.error}');
    }
    return [];
  }
}
