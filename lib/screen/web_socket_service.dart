import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebSocketService {
  final WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse('ws://192.168.43.146:8080'), // IP ของ Server
  );

  Stream<dynamic> get stream => channel.stream;

  void dispose() {
    channel.sink.close();
  }
}

class SensorManager {
  Future<void> saveSensorValue(String sensorKey, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(sensorKey, value);
  }

  Future<int> getSensorValue(String sensorKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(sensorKey) ?? 0; // ถ้าไม่มีค่าจะใช้ 0 เป็นค่าเริ่มต้น
  }
}
