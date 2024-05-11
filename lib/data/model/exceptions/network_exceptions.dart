import 'package:hello_flutter/base/base_exception.dart';

class NetworkException extends BaseException {
  NetworkException(super.message, {required super.code});
}
