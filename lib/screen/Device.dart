import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_workshop/screen/notification.dart';

class sensorscreen extends StatefulWidget {
  const sensorscreen({super.key});

  @override
  State<sensorscreen> createState() => _sensorscreenState();
}

class _sensorscreenState extends State<sensorscreen> {
  int sensor1Value = 0;
  int sensor2Value = 0;
  int sensor3Value = 0;
  int sensor4Value = 0;

  @override
  void initState() {
    super.initState();
    _loadSensorValues();
  }

  Future<void> _loadSensorValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      sensor1Value = prefs.getInt('sensor_1') ?? 0;
      sensor2Value = prefs.getInt('sensor_2') ?? 0;
      sensor3Value = prefs.getInt('sensor_3') ?? 0;
      sensor4Value = prefs.getInt('sensor_4') ?? 0;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.all(6),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2,
        children: <Widget>[
          GestureDetector(
            // Grid 1
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context)!.clear_plas),
                        const SizedBox(width: 10),
                        Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: sensor1Value == 1 ? FullColor : EmptyColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: Text(
                                sensor1Value == 1
                                    ? AppLocalizations.of(context)!.full
                                    : AppLocalizations.of(context)!.empty,
                                style: const TextStyle(
                                  color: FontColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    content: Text(
                      AppLocalizations.of(context)!.descri_1,
                      style: const TextStyle(fontSize: 15, color: FontColor),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          AppLocalizations.of(context)!.close,
                          style:
                              const TextStyle(color: FontColor, fontSize: 15),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.only(left: 7, top: 7, bottom: 7),
              decoration: BoxDecoration(
                color: Grey2Color.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: BlueBinColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        'assets/bin01.png',
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.clear_plas,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: FontblackColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                          color: sensor1Value == 1 ? FullColor : EmptyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              sensor1Value == 1
                                  ? AppLocalizations.of(context)!.full
                                  : AppLocalizations.of(context)!.empty,
                              style: const TextStyle(
                                color: FontColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            //Gride 2
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context)!.color_plas),
                        const SizedBox(width: 10),
                        Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: sensor2Value == 1 ? FullColor : EmptyColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: Text(
                                sensor2Value == 1
                                    ? AppLocalizations.of(context)!.full
                                    : AppLocalizations.of(context)!.empty,
                                style: const TextStyle(
                                  color: FontColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    content: Text(
                      AppLocalizations.of(context)!.descri_2,
                      style: const TextStyle(fontSize: 15, color: FontColor),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(AppLocalizations.of(context)!.close,
                            style: const TextStyle(
                                color: FontColor, fontSize: 15)),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.only(left: 7, top: 7, bottom: 7),
              decoration: BoxDecoration(
                color: Grey2Color.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: RedColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        'assets/bin01.png',
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.color_plas,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: FontblackColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                          color: sensor2Value == 1 ? FullColor : EmptyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              sensor2Value == 1
                                  ? AppLocalizations.of(context)!.full
                                  : AppLocalizations.of(context)!.empty,
                              style: const TextStyle(
                                color: FontColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            //Gride 3
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context)!.cloudy_plas),
                        const SizedBox(width: 10),
                        Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: sensor3Value == 1 ? FullColor : EmptyColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: Text(
                                sensor3Value == 1
                                    ? AppLocalizations.of(context)!.full
                                    : AppLocalizations.of(context)!.empty,
                                style: const TextStyle(
                                  color: FontColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    content: Text(
                      AppLocalizations.of(context)!.descri_3,
                      style: const TextStyle(fontSize: 15, color: FontColor),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(AppLocalizations.of(context)!.close,
                            style: const TextStyle(
                                color: FontColor, fontSize: 15)),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.only(left: 9, top: 9, bottom: 9),
              decoration: BoxDecoration(
                color: Grey2Color.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: OrangeBinColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        'assets/bin01.png',
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80, // กำหนดความกว้างที่แน่นอนให้กับ Text
                        child: Text(
                          AppLocalizations.of(context)!.cloudy_plas,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: FontblackColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                          color: sensor3Value == 1 ? FullColor : EmptyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              sensor3Value == 1
                                  ? AppLocalizations.of(context)!.full
                                  : AppLocalizations.of(context)!.empty,
                              style: const TextStyle(
                                color: FontColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            //Gride 4
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context)!.other),
                        const SizedBox(width: 10),
                        Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: sensor4Value == 1 ? FullColor : EmptyColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: Text(
                                sensor4Value == 1
                                    ? AppLocalizations.of(context)!.full
                                    : AppLocalizations.of(context)!.empty,
                                style: const TextStyle(
                                  color: FontColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    content: Text(
                      AppLocalizations.of(context)!.descri_4,
                      style: const TextStyle(fontSize: 15, color: FontColor),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(AppLocalizations.of(context)!.close,
                            style: const TextStyle(
                                color: FontColor, fontSize: 15)),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.only(left: 7, top: 7, bottom: 7),
              decoration: BoxDecoration(
                color: Grey2Color.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: SkyeBlueColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        'assets/bin01.png',
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.other,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: FontblackColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                          color: sensor4Value == 1 ? FullColor : EmptyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              sensor4Value == 1
                                  ? AppLocalizations.of(context)!.full
                                  : AppLocalizations.of(context)!.empty,
                              style: const TextStyle(
                                color: FontColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class historyscreen extends StatefulWidget {
  const historyscreen({super.key});

  @override
  State<historyscreen> createState() => _historyscreenState();
}

class _historyscreenState extends State<historyscreen> {
  List<Map<String, dynamic>> historyList = [];
  @override
  void initState() {
    super.initState();
    _fetchHistory();
  }

  Future<void> _fetchHistory() async {
    String baseUrl;
    if (kIsWeb) {
      // รันบนเว็บ (Chrome, Safari, etc.)
      baseUrl =
          'http://localhost:3300/gethistory'; // IP Address เครื่องคอมพิวเตอร์
    } else if (Platform.isAndroid) {
      // สำหรับโทรศัพท์จริง
      baseUrl = 'http://192.168.43.146:3300/gethistory';
    } else {
      // สำหรับแพลตฟอร์มอื่น ๆ
      baseUrl = 'http://11.0.100.11:3300/gethistory';
    }

    final url = Uri.parse(baseUrl);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        // ตรวจสอบว่าหน้าจอยังคงเปิดอยู่ก่อนเรียก setState
        if (mounted) {
          setState(() {
            historyList = data
                .map((item) => {
                      'type': item['type'],
                      'numbin': item['numbin'],
                      'imageBase64': item['imageBase64'] as String,
                      // แปลงให้เป็น String อีกครั้งหลังจากแปลงเขตเวลาเป็นท้องถิ่น
                      'create_at': DateTime.parse(item['create_at'])
                          .toLocal()
                          .toString(),
                    })
                .toList();
            historyList.sort((a, b) {
              DateTime dateA = DateTime.parse(a['create_at']);
              DateTime dateB = DateTime.parse(b['create_at']);
              return dateB
                  .compareTo(dateA); // จัดเรียงจากมากไปหาน้อย (ล่าสุดก่อน)
            });
          });
        }
      } else {
        print('Failed to load history');
      }
    } catch (e) {
      print('Error fetching history: $e');
    }
  }

  String _formatDateTime(String dateTime) {
    final dateTimeObj = DateTime.parse(dateTime);
    return DateFormat('yyyy-MM-dd HH:mm').format(dateTimeObj);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          Expanded(
            child: historyList.isEmpty
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: historyList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Grey2Color.withOpacity(1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.memory(
                                base64Decode(historyList[index]['imageBase64']),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${AppLocalizations.of(context)!.typr}: ${historyList[index]['type']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                        '${AppLocalizations.of(context)!.bin_num}: ${historyList[index]['numbin']}'),
                                    Text(
                                      '${AppLocalizations.of(context)!.classi_at}: ${_formatDateTime(historyList[index]['create_at'])}',
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
          ),
        ],
      ),
    );
  }
}
