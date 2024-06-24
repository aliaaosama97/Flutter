import 'package:dio/dio.dart';

class WebServices {
  late Dio dio = Dio();

  void getHttp() async {
    final response = await dio.get('end point');
    print(response);
  }

  void configureDio() {
    // Set default configs
    dio.options.baseUrl = 'https://api.pub.dev';
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);

    // Or create `Dio` with a `BaseOptions` instance.
    final options = BaseOptions(
      baseUrl: 'https://api.pub.dev',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    );
    final anotherDio = Dio(options);
  }

  void request() async {
    Response response;
    response = await dio.get('/test?id=12&name=dio');
    print(response.data.toString());
    // The below request is the same as above.
    response = await dio.get(
      '/test',
      queryParameters: {'id': 12, 'name': 'dio'},
    );
    print(response.data.toString());
  }



}
