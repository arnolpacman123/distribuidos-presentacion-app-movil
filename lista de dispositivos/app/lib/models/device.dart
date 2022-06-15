import 'dart:convert';

List<Device> devicesFromJson(String str) =>
    List<Device>.from(json.decode(str).map((x) => Device.fromJson(x)));

String devicesToJson(List<Device> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Device {
  Device({
    this.id,
    this.identifier,
    this.date,
    this.temperature,
    this.humidity,
    this.connected,
  });

  final int? id;
  final String? identifier;
  final DateTime? date;
  final double? temperature;
  final double? humidity;
  final bool? connected;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json["id"],
        identifier: json["identifier"],
        date: DateTime.parse(json["date"]),
        temperature: json["temperature"] + .0,
        humidity: json["humidity"] + .0,
        connected: json["connected"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "identifier": identifier,
        "date": date!.toIso8601String(),
        "temperature": temperature,
        "humidity": humidity,
        "connected": connected,
      };
}
