import 'package:http/http.dart' as http;

import 'package:app/models/device.dart';

class DeviceService {
  static const String url = 'http://10.0.2.2:3000/api';

  static Future<List<Device>> getAllDevices() async {
    List<Device> devices = [];
    final response = await http.get(Uri.parse("$url/devices"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final String json = response.body;
      devices = devicesFromJson(json);
    }
    return devices;
  }
}
