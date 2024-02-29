import 'dart:convert';

import 'package:todo_list/common/const/data.dart';

class DataUtils {
  static String pathToUrl(String value) {
    return "http://$ip$value";
  }

  static List<String> listPathsToUrls(List value) {
    return value.map((e) => pathToUrl(e)).toList();
  }

  static String plainToBase64(String plain) {
    Codec<String, String> strToBase64 = utf8.fuse(base64);

    String encoded = strToBase64.encode(plain);

    return encoded;
  }

  static DateTime stringToDateTime(String value) {
    return DateTime.parse(value);
  }
}
