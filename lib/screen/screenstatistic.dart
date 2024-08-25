import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_workshop/constants/indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenHis extends StatefulWidget {
  const ScreenHis({super.key});

  @override
  State<ScreenHis> createState() => _ScreenHisState();
}

class _ScreenHisState extends State<ScreenHis> {
  Map<int, int> numbinStats = {};
  List<Map<String, dynamic>> statsData = [];

  @override
  void initState() {
    super.initState();
    _fetchNumbinStats();
  }

  Future<void> _fetchNumbinStats() async {
    String baseUrl;
    if (kIsWeb) {
      baseUrl = 'http://localhost:3300/getnumbinstats';
    } else if (Platform.isAndroid) {
      baseUrl = 'http://192.168.43.146:3300/getnumbinstats';
    } else {
      baseUrl = 'http://11.0.100.11:3300/getnumbinstats';
    }

    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print('Response data: $responseBody');

      setState(() {
        final oneWeekAgo = DateTime.now().subtract(const Duration(days: 7));

        // Clear previous data
        numbinStats = {};
        statsData = [];

        Map<String, dynamic> data = Map<String, dynamic>.from(responseBody);

        data.forEach((key, value) {
          try {
            int numbin = int.parse(key);
            int count = value; // ใช้ value โดยตรงเป็น count
            // Update numbinStats for all-time data
            numbinStats[numbin] = (numbinStats[numbin] ?? 0) + count;
            // Add data to statsData
            statsData.add({
              'type': numbin,
              'count': count,
              // 'date': dataDate.toString(), // ไม่มีการใช้ date ในที่นี้
            });
          } catch (e) {
            print('Error processing key: $key, error: $e');
          }
        });
      });
    } else {
      print('Failed to load numbin stats');
    }
  }

  List<FlSpot> _getSpots() {
    if (statsData.isEmpty) {
      return [];
    }

    return statsData.map((entry) {
      final type = entry['type'] as int;
      final count = entry['count'] as int;
      return FlSpot(type.toDouble() - 1, count.toDouble());
    }).toList();
  }

  List<PieChartSectionData> _getSections() {
    if (numbinStats.isEmpty) {
      return [
        PieChartSectionData(value: 1, color: Colors.grey, title: 'No data')
      ];
    }

    return numbinStats.entries.map((entry) {
      final numbin = entry.key;
      final count = entry.value;
      final double percentage =
          count / numbinStats.values.reduce((a, b) => a + b) * 100;

      Color color;
      switch (numbin) {
        case 1:
          color = BlueBinColor;
          break;
        case 2:
          color = RedBinColor;
          break;
        case 3:
          color = OrangeBinColor;
          break;
        case 4:
          color = SkyeBlueColor;
          break;
        default:
          color = Colors.grey;
      }

      return PieChartSectionData(
        color: color,
        value: percentage,
        title: '${percentage.toStringAsFixed(0)}%',
        showTitle: true,
        titleStyle: const TextStyle(color: BlackColor, fontSize: 18),
      );
    }).toList();
  }

  SideTitles TypePlastic() {
    return SideTitles(
      showTitles: true,
      interval: 1,
      getTitlesWidget: (double value, TitleMeta meta) {
        const style = TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        );
        Map<int, String> typeMap = {
          1: 'Type 1',
          2: 'Type 2',
          3: 'Type 3',
          4: 'Type 4',
        };

        String title = typeMap[value.toInt()] ?? '';
        return SideTitleWidget(
          axisSide: meta.axisSide,
          child: Text(title, style: style),
        );
      },
      reservedSize: 28,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.statistics,
          style: const TextStyle(
            fontSize: 22,
            color: FontColor,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: GridView.count(
          padding: const EdgeInsets.all(8),
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.5,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Indicator(
                        color: BlueBinColor,
                        text: AppLocalizations.of(context)!.clear,
                        isSquare: false,
                        size: 20,
                      ),
                      Indicator(
                        color: RedBinColor,
                        text: AppLocalizations.of(context)!.color,
                        isSquare: false,
                        size: 20,
                      ),
                      Indicator(
                        color: OrangeBinColor,
                        text: AppLocalizations.of(context)!.cloudy,
                        isSquare: false,
                        size: 20,
                      ),
                      Indicator(
                        color: SkyeBlueColor,
                        text: AppLocalizations.of(context)!.other,
                        isSquare: false,
                        size: 20,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: numbinStats.isEmpty
                          ? const CircularProgressIndicator()
                          : PieChart(
                              PieChartData(
                                sections: _getSections(),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 5,
                                startDegreeOffset: 180,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.bottleofweek,
                    style: const TextStyle(color: FontColor, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: numbinStats.isEmpty
                          ? const CircularProgressIndicator()
                          : LineChart(
                              LineChartData(
                                minY: 0,
                                maxY: 60,
                                minX: 0,
                                maxX: 3,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: _getSpots(),
                                    color: PrimaryColor,
                                    barWidth: 4,
                                    isCurved: true,
                                  ),
                                ],
                                titlesData: FlTitlesData(
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  bottomTitles: AxisTitles(
                                    axisNameWidget: Text(
                                      AppLocalizations.of(context)!.typeofbot,
                                      style: const TextStyle(color: FontColor),
                                    ),
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 1,
                                      getTitlesWidget: (value, meta) {
                                        const style = TextStyle(
                                          color: FontColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        );
                                        Map<int, String> typeMap = {
                                          0: AppLocalizations.of(context)!
                                              .clear_plas,
                                          1: AppLocalizations.of(context)!
                                              .color_plas,
                                          2: AppLocalizations.of(context)!
                                              .cloudy_plas,
                                          3: AppLocalizations.of(context)!
                                              .other,
                                        };

                                        String title =
                                            typeMap[value.toInt()] ?? '';
                                        return SideTitleWidget(
                                          axisSide: meta.axisSide,
                                          child: Text(title, style: style),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
