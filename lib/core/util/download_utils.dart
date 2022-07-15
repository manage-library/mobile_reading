import 'dart:io';
import 'package:book_reading_mobile_app/core/util/alert_utils.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path/path.dart';

class DownloadUtils {
  final _dio = Dio();

  DownloadUtils._();

  static final shared = DownloadUtils._();

  download(
      {required String fromURL,
      String? savePath,
      CancelToken? cancelToken,
      int? previousFileSize,
      Function(int downloadedFileSize, int totalFizeSize)? completion,
      Function? onDownloadSuccessful}) async {
    String? path;

    Stream.value(savePath).flatMap((value) {
      if (value == null) {
        final directory = Platform.isAndroid ? getAndroidDownloadDirectory() : getApplicationDocumentsDirectory();
        return Stream.fromFuture(directory);
      }

      return Stream.value(value);
    }).map((value) {
      final file = File(fromURL);
      final fileName = basename(file.path);

      if (value is String) {
        path = value + '/$fileName';
      } else if (value is Directory) {
        path = value.path + '/$fileName';
      }

      final options = Options(headers: {HttpHeaders.acceptEncodingHeader: '*'});

      if (previousFileSize != null) {
        options.headers?.addAll({HttpHeaders.rangeHeader: 'bytes=$previousFileSize-'});
      }

      return options;
    }).flatMap((options) {
      return _dio.download(fromURL, '$path', cancelToken: cancelToken, options: options,
          onReceiveProgress: (count, total) {
        if (total != -1) {
          completion?.call(count, total);
        }
      }).asStream();
    }).listen((response) {
      onDownloadSuccessful?.call();
    }, onError: (e) {
      AlertUtils.showToastError(message: 'Vui lòng thử lại sau');
      // logger.e(e.toString());
      cancelToken?.cancel(e.toString());
    });
  }

  Future<Directory> getAndroidDownloadDirectory() async {
    return Directory('/storage/emulated/0/Download');
  }
}
