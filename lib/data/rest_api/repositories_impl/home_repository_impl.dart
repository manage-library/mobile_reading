import 'package:book_reading_mobile_app/configs/api_config.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/models/api_response.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/models/api_result.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/rest_client.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/category.dart';
import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:sprintf/sprintf.dart';

abstract class HomeRepository {
  Future<User?> getUserInfo();
  Future<List<Category?>> getCategory();
  Future<List<User?>> getListAuthor();
   Future<Book?> getBookById({String? id});
}
class HomeRepositoryImpl extends HomeRepository {
  final RestClient _restClient = RestClient();
  @override
  Future<User?> getUserInfo() async {
    try {
      var response = await _restClient.getMethod(ApiConfig.getInfoUser, params: {});
      print('response : $response');
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<User>(
          json: json,
          jsonConverter: (json) => User.fromJson(json),
        )
      ).result?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse.error : ${apiResponse.error}');
    }
    return null;
    
  }

  @override
  Future<List<Category?>> getCategory() async{
    try {
      var response = await _restClient.getMethod(ApiConfig.getCategory, params: {});
      print("responseCategory : $response");
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultList<Category>(json: json, jsonConverter: (json) => Category.fromJson(json))
      ).result?.data;
    } catch(error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponseCategory.error : ${apiResponse.error}');
    }
    return [];
  }
  
  @override
  Future<List<Book?>> getBooks({bool? isVip, int? sortBy, String? sortType, int? categoryId}) async {
    var response;
    try {
      if(isVip == null && sortBy == null && sortType == null) {
         response = await _restClient.getMethod(ApiConfig.getBooks, params: {});
      } else {
         response = await _restClient.getMethod(ApiConfig.getBooks, params: {'isVip' : isVip, 'sortBy' : sortBy, 'sortType' : sortType});
      }   
      if(categoryId != null) {
         response = await _restClient.getMethod(ApiConfig.getBooks, params: {'categoryId' : categoryId});
      }
      print("responseBookList : $response");
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultList<Book>(json: json,jsonConverter: (json) => Book.fromJson(json))
      ).result?.data;
    } catch (error) {
       ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponseBookList.error : ${apiResponse.error}');
    }
      return [];
  }

  @override
  Future<List<User?>> getListAuthor() async{
     try {
      var response = await _restClient.getMethod(ApiConfig.getListUser, params: {});
      print("responseListAuthor : $response");
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultList<User>(json: json, jsonConverter: (json) => User.fromJson(json))
      ).result?.data;
    } catch(error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponseListAuthor.error : ${apiResponse.error}');
    }
    return [];
  }

   Future<Book?> getBookById({String? id}) async {
    try {
      var response = await _restClient.getMethod(sprintf(ApiConfig.getBookById, [id]), params: {});
      print('response : $response');
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<Book>(
          json: json,
          jsonConverter: (json) => Book.fromJson(json),
        )
      ).result?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse.error : ${apiResponse.error}');
    }
    return null;
  }
  
}