import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'web_socket_service.dart';

class WebSocketNotifier extends ChangeNotifier {
  final WebSocketService _webSocketService;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  List<String> notifications = []; // สร้าง List สำหรับเก็บข้อความการแจ้งเตือน

  int previousSensorValue1 = 0;
  int previousSensorValue2 = 0;
  int previousSensorValue3 = 0;
  int previousSensorValue4 = 0;

  WebSocketNotifier(
      this._webSocketService, this._flutterLocalNotificationsPlugin) {
    _webSocketService.stream.listen((data) {
      _handleWebSocketData(data);
    });
  }

  void clearNotifications() {
    notifications.clear();
    notifyListeners(); // แจ้งเตือนว่ารายการแจ้งเตือนถูกเคลียร์แล้ว
  }

  void _handleWebSocketData(String receivedData) {
    if (receivedData.startsWith("{") && receivedData.endsWith("}")) {
      try {
        var data = jsonDecode(receivedData);
        int sensor = int.tryParse(data['sensor'] ?? '0') ?? 0;
        int value = int.tryParse(data['value'] ?? '0') ?? 0;

        // ตรวจสอบเซ็นเซอร์และเพิ่มการแจ้งเตือนใน List
        if (sensor == 1 && previousSensorValue1 == 0 && value == 1) {
          _notifyAndUpdateSensor('1', '1');
        } else if (sensor == 2 && previousSensorValue2 == 0 && value == 1) {
          _notifyAndUpdateSensor('2', '1');
        } else if (sensor == 3 && previousSensorValue3 == 0 && value == 1) {
          _notifyAndUpdateSensor('3', '1');
        } else if (sensor == 4 && previousSensorValue4 == 0 && value == 1) {
          _notifyAndUpdateSensor('4', '1');
        }

        // อัปเดตค่าก่อนหน้าของเซ็นเซอร์แต่ละตัว
        if (sensor == 1) previousSensorValue1 = value;
        if (sensor == 2) previousSensorValue2 = value;
        if (sensor == 3) previousSensorValue3 = value;
        if (sensor == 4) previousSensorValue4 = value;

        notifyListeners(); // แจ้งเตือนการเปลี่ยนแปลงใน UI (หากจำเป็น)
      } catch (e) {
        print('Error parsing JSON data: $e');
      }
    }
  }

  Future<void> _notifyAndUpdateSensor(String sensorId, String newValue) async {
    try {
      // 1. อัปเดตค่าของเซ็นเซอร์ใน SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('sensor_$sensorId', newValue);

      // 2. แสดงการแจ้งเตือนใน UI และบันทึกใน List
      notifications.add('Bin : $sensorId is FULL');
      notifyListeners(); // แจ้งเตือนว่ามีการเพิ่มการแจ้งเตือนใหม่

      // 3. แสดงการแจ้งเตือนในระบบ
      var androidDetails = const AndroidNotificationDetails(
        'channel_id', // channelId
        'Channel Name', // channelName
        importance: Importance.max,
        priority: Priority.high,
      );
      var notificationDetails = NotificationDetails(android: androidDetails);

      await _flutterLocalNotificationsPlugin.show(
        0,
        'Bin $sensorId ',
        'Bin $sensorId : is FULL',
        notificationDetails,
      );
    } catch (e) {
      print('Error updating sensor and sending notification: $e');
    }
  }

  @override
  void dispose() {
    _webSocketService.dispose();
    super.dispose();
  }
}
