import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
class FileUtils {


/*  static Future<bool> saveImage(String url) async {
    final xFile = await getXFileFromUrl(url);
    final response = await GallerySaver.saveImage(xFile.path);
    return response!;
  }*/

  static String base64EncodeFormat(Uint8List images) {
    String format = 'data:images/jpeg;base64,';
    String data = base64Encode(images);
    return format + data;
  }

  static Map<String, dynamic> removeNull(Map<String, dynamic> map) {
    map.removeWhere((key, value) => value == null);
    return map;
  }

  static Future<Uint8List> readByteFromUrl(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return bytes;
  }

  static Future<File> writeToFile(Uint8List data, String path) {
    return File(path).writeAsBytes(data);
  }

  static Future<XFile> getXFileFromUrl(String url) async {
    final regexp = RegExp(r'\w+.jpeg');
    final dir = await getApplicationDocumentsDirectory();
    final getFileName = regexp.firstMatch(url)?.group(0);
    String path = '${dir.path}/$getFileName';
    final bytes = await FileUtils.readByteFromUrl(url);
    await FileUtils.writeToFile(bytes, path);
    XFile tmp = XFile(path);
    return tmp;
  }


  static Future<String> getFilePath(String fileName) async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath/$fileName'; // 3
    return filePath;
  }

  static Future<double> getFileSizeAsKB({Uint8List? img, String? filepath, int? decimals}) async {
    int bytes;
    if (img != null) {
      bytes = img.lengthInBytes;
    } else {
      var file = File(filepath!);
      bytes = await file.length();
    }
    if (bytes <= 0) return 0;
    // const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return (bytes / pow(1024, i));
    //return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
  }

  Future<List<File>?> chooseImages() async {
  final ImagePicker _picker = ImagePicker();
  final images = await _picker.pickMultiImage();

  return images?.map((e) => File(e.path)).toList();
}

static Future<File?> chooseImage() async {
  final ImagePicker _picker = ImagePicker();
  final image =
      await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
  if (kDebugMode) {
    print(await image?.length());
  }
  return image != null ? File(image.path) : null;
}

Future<File?> chooseImageWithFilePicker() async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );
  return result?.files.single.path != null
      ? File(result!.files.single.path!)
      : null;
}
}