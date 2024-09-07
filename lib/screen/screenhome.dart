import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/router/routes.gr.dart';
import 'package:flutter_workshop/screen/notification.dart';
import 'package:flutter_workshop/screen/Device.dart';
import 'package:flutter_workshop/constants/variable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_workshop/screen/notification.dart';

Future<int?> getDeviceData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('device');
}

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int? device;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDeviceData();
  }

  Future<void> loadDeviceData() async {
    try {
      device = await getDeviceData();
    } catch (e) {
      print('Error loading device data: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: whiteColor,
        body: Center(
          child: CircularProgressIndicator(), // Show loading indicator
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Builder(
          builder: (BuildContext context) {
            if (device == 1) {
              return HaveDeviceScreen();
            } else {
              return NoDeviceScreen();
            }
          },
        ),
      ),
    );
  }
}

class HaveDeviceScreen extends StatefulWidget {
  const HaveDeviceScreen({super.key});
  @override
  State<HaveDeviceScreen> createState() => _HaveDeviceScreenState();
}

class _HaveDeviceScreenState extends State<HaveDeviceScreen> {
  List<Map<String, dynamic>> historyList = [];
  List<String> notifications = [];
  bool isPoweredOn = true;
  int? _selectedTabIndex = 0;

  Future<void> _refreshSensorData() async {
    String baseUrl;
    if (kIsWeb) {
      //รันบนเว็บ (Chrome, Safari, etc.)
      baseUrl =
          'http://localhost:3300/api/sensor-data'; // IP Address เครื่องคอมพิวเตอร์
    } else if (Platform.isAndroid) {
      // สำหรับโทรศัพท์จริง
      baseUrl = 'http://192.168.43.146:3300/api/sensor-data';
    } else {
      // สำหรับแพลตฟอร์มอื่น ๆ
      baseUrl = 'http://11.0.100.11:3300/api/sensor-data';
    }
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> sensorData = jsonDecode(response.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();

        // วนลูปเพื่อบันทึกข้อมูลแต่ละเซ็นเซอร์ลงใน SharedPreferences
        for (var sensor in sensorData) {
          String sensorId = sensor['sensor'];
          int sensorValue = int.parse(sensor['value']);

          await prefs.setInt('sensor_$sensorId', sensorValue);
        }

        print("Sensor data fetched and saved.");
      } else {
        throw Exception('Failed to load sensor data');
      }
    } catch (error) {
      print('Error fetching sensor data: $error');
    }
    setState(() {});
  }

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

  // ฟังก์ชันแสดงการแจ้งเตือน (เรียกใช้จากที่อื่นๆ เมื่อมีการแจ้งเตือน)
  void addNotification(String message) {
    setState(() {
      notifications.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: whiteColor,
                    size: 25,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return NotificationScreen(); // แสดง NotificationScreen ใน Dialog
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: IconButton(
                  icon: const Icon(
                    Icons.refresh_outlined,
                    color: whiteColor,
                    size: 25,
                  ),
                  onPressed: _refreshSensorData,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.06,
              left: 50,
              right: 50,
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 195, 243, 227),
                  borderRadius: BorderRadius.circular(
                      (MediaQuery.of(context).size.width - 100) / 2),
                  boxShadow: [
                    BoxShadow(
                      color: GreyColor.withOpacity(0.1),
                      spreadRadius: 30,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    customColors: CustomSliderColors(
                      trackColor: whiteColor,
                      progressBarColors: [
                        const Color.fromARGB(255, 255, 235, 59),
                        const Color.fromARGB(255, 255, 241, 118),
                        const Color.fromARGB(255, 66, 189, 65),
                        const Color.fromARGB(255, 43, 175, 43),
                        const Color.fromARGB(255, 10, 143, 8),
                      ],
                      shadowColor: Colors.white.withOpacity(0.5),
                      shadowMaxOpacity: 1,
                      gradientStartAngle: 1,
                      gradientEndAngle: 180,
                    ),
                    infoProperties: InfoProperties(
                      mainLabelStyle: const TextStyle(
                        color: FontblackColor,
                        fontSize: 50,
                      ),
                      modifier: (double value) => '${value.toInt()}%',
                    ),
                    customWidths: CustomSliderWidths(
                      trackWidth: 25,
                      progressBarWidth: 25,
                      shadowWidth: 30,
                    ),
                  ),
                  initialValue: 60,
                  onChange: null,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.315,
              left: (MediaQuery.of(context).size.width - 90) / 2,
              child: FutureBuilder<String>(
                future: checkConnectionStatus(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // แสดง loading ขณะรอผลลัพธ์
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
            Positioned(
              top: MediaQuery.of(context).size.height * 0.45,
              left: 5,
              right: 5,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: (MediaQuery.of(context).size.width / 2.4),
                      height: 45,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/servo.png',
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            AppLocalizations.of(context)!.servo,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width / 2.4),
                      height: 45,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/servo.png',
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            AppLocalizations.of(context)!.servo,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Image.asset(
                          'assets/webcam2.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.4,
              maxChildSize: 0.6,
              builder: (context, ScrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    controller: ScrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width),
                          height: (MediaQuery.of(context).size.height),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 10),
                              ToggleSwitch(
                                minWidth: (MediaQuery.of(context).size.width),
                                cornerRadius: 8.0,
                                activeBgColors: const [
                                  [whiteColor],
                                  [whiteColor]
                                ],
                                borderColor: const [GreyColor],
                                activeFgColor: FontblackColor,
                                inactiveBgColor: GreyColor,
                                inactiveFgColor: FontblackColor,
                                initialLabelIndex: _selectedTabIndex,
                                totalSwitches: 2,
                                labels: [
                                  AppLocalizations.of(context)!.sensor,
                                  AppLocalizations.of(context)!.history
                                ],
                                radiusStyle: true,
                                onToggle: (index) {
                                  print('switched to: $index');
                                  setState(() {
                                    _selectedTabIndex = index;
                                  });
                                },
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (BuildContext context) {
                                    if (_selectedTabIndex == 0) {
                                      return const sensorscreen();
                                    } else {
                                      return const historyscreen();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NoDeviceScreen extends StatefulWidget {
  const NoDeviceScreen({super.key});

  @override
  State<NoDeviceScreen> createState() => _NoDeviceScreenState();
}

class _NoDeviceScreenState extends State<NoDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 400.0,
                          maxHeight: 240.0,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset('assets/logo3.png'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context)!.nodvice,
                            style: const TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\n${AppLocalizations.of(context)!.subdevice}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 25.0),
                          ElevatedButton(
                            onPressed: () {
                              print('Add devices');
                              context.router.replace(AdddeviceRoute());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: SecondaryColor,
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.adddevice,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: PrimaryColor, fontSize: 18.0),
                            ),
                          ),
                          const SizedBox(height: 25.0),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
