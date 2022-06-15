import 'package:flutter/material.dart';

import 'package:app/services/device_service.dart';
import 'package:app/models/device.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Device> devices = [];

  @override
  void initState() {
    super.initState();
    getAllDevices();
  }

  void getAllDevices() async {
    devices = await DeviceService.getAllDevices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de dispositivos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final identifier = devices[index].identifier!;
                  final temperature = devices[index].temperature!;
                  final humidity = devices[index].humidity!;
                  final date = devices[index].date!.toUtc();
                  final dateFormat =
                      "${date.day}/${date.month}/${date.year} ${date.hour >= 4 ? (date.hour - 4) : (date.hour - 4 + 24)}:${date.minute}:${date.second}";
                  final connected = devices[index].connected!;
                  return SizedBox(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: InkWell(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                        onTap: () {},
                        child: Card(
                          elevation: 5.0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dispositivo: $identifier",
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    "Temperatura: $temperature",
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    "Humedad: $humidity",
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    "Últ. registro: $dateFormat",
                                    style: const TextStyle(fontSize: 16.0),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.wifi_outlined,
                                color: connected ? Colors.green : Colors.grey,
                                size: 40.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
