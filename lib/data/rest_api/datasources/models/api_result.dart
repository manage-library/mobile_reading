import 'package:book_reading_mobile_app/data/rest_api/datasources/models/metadata.dart';

abstract class ApiResult<T> {
  T? _data;

  ApiResult();

  T? get data => _data;
}

//khi dữ liệu API trả về dang list
class ApiResultList<T> extends ApiResult<List<T>> {
  Metadata? _metadata;
  
  ApiResultList({
    List? json,
   // required String rootName,
    required T Function(dynamic json1) jsonConverter,
  }) {
    // if (json.containsKey('metadata')) {
    //   _metadata = Metadata.fromJson(json['metadata']);
    // }
  //  var dataJson = json[rootName];
//  print("category json : $json");
  var dataJson = json as List;
    //if (dataJson is List) {
      _data = dataJson.map(jsonConverter).toList();
  //  }
  }
}

//khi dữ liệu API trả về là 1 phần từ
class ApiResultSingle<T> extends ApiResult<T> {
  ApiResultSingle({
    required Map<String, dynamic> json,
    String? rootName,
    required T Function(dynamic json) jsonConverter,
  }) {
    _data = jsonConverter(json);
  }
}

