import 'package:dio/dio.dart';
import 'dio.dart';

Future<Map<String, dynamic>> createQRCode(
    String ssid,
    String pass,
    String func,
    String security,
    String logo,
    String date,
    String time,
    ) async {
  try {

    print('djaflkjnadf one');
    var response = await dio.post('wifi/test-qr/',
        data: {
          "wifi_ssid": ssid, //
          "wifi_password": pass, //
          "function": func,
          "security": security,
          "logo": logo, //
          "date": date,
          "time": time,
        });
    print('response is ${response.data}');

    return {'status': 'success', 'data': response.data};
  } on DioError catch (e) {
    return getErrorResponse(e);
  }
}