import 'package:hello_flutter/data/model/base_exception.dart';

class NetworkException extends BaseException {
  NetworkException(super.message, {required super.code});
}
