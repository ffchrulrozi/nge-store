import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class BaseProvider extends ChangeNotifier{
  Dio dio = Dio();
}