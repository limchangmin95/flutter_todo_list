import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_list/common/secure_storage/secure_storage.dart';

final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio();

    final storage = ref.watch(secureStorageProvider);

    dio.interceptors.add(
      CustomInterceptor(
        storage: storage,
      ),
    );

    return dio;
  },
);

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({
    required this.storage,
  });
}
