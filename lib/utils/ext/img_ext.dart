import 'package:flutter_dotenv/flutter_dotenv.dart';

extension ImgExt on String {
  String imgFromNetwork() => dotenv.env["BASE_HOST_URL"]! + this;
}
