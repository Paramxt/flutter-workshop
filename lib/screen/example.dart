import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool isPoweredOn = true;
  Future<void> _sendRequest(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('Success: ${response.body}');
      } else {
        print('Failed to connect to the server');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _togglePower() {
    setState(() {
      isPoweredOn = !isPoweredOn;
    });

    // ส่งคำขอไปที่ API ตามสถานะ
    if (isPoweredOn) {
      _sendRequest('http://192.168.43.146:3300/start');
    } else {
      _sendRequest('http://192.168.43.146:3300/stop');
    }
  }

  Future<String> checkConnectionStatus() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.43.146:3300/status'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'Failed to get status';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Control Raspberry Pi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<String>(
            future: checkConnectionStatus(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // แสดง loading ขณะรอผลลัพธ์
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Connection Status: ${snapshot.data}'),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (!states.contains(MaterialState.pressed)) {
                                return Colors.white; // สีปุ่มเมื่อไม่ได้กด
                              }
                              return null;
                            },
                          ),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (!states.contains(MaterialState.pressed)) {
                                return isPoweredOn
                                    ? Colors.green
                                    : Colors.red; // สีปุ่มตามสถานะ
                              }
                              return null;
                            },
                          ),
                        ),
                        onPressed: _togglePower, // เรียกฟังก์ชันเมื่อกดปุ่ม
                        child: const Icon(
                          Icons.power_settings_new,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Text('No data');
              }
            },
          ),
        ),
      ),
    );
  }
}
