import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/router/routes.gr.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class sensorscreen extends StatelessWidget {
  const sensorscreen({super.key});

  @override
  Widget build(BuildContext context) {
    int _Bin1 = 1;
    int _Bin2 = 0;
    int _Bin3 = 1;
    int _Bin4 = 1;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  color: SkyeBlueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: BlueBinColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/bin01.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 70,
                          width: 120,
                          child: Column(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.clear,
                                style: TextStyle(
                                  color: FontblackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: _Bin1 == 1 ? FullColor : EmptyColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _Bin1 == 1
                                        ? AppLocalizations.of(context)!.full
                                        : AppLocalizations.of(context)!.empty,
                                    style: TextStyle(
                                      color: FontColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  color: SkyeBlueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: OrangeBinColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/bin01.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 70,
                          width: 120,
                          child: Column(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.color,
                                style: TextStyle(
                                  color: FontblackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: _Bin2 == 1 ? FullColor : EmptyColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _Bin2 == 1
                                        ? AppLocalizations.of(context)!.full
                                        : AppLocalizations.of(context)!.empty,
                                    style: TextStyle(
                                      color: FontColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  color: SkyeBlueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: GreenBinColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/bin01.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 70,
                          width: 120,
                          child: Column(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.cloudy,
                                style: TextStyle(
                                  color: FontblackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: _Bin3 == 1 ? FullColor : EmptyColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _Bin3 == 1
                                        ? AppLocalizations.of(context)!.full
                                        : AppLocalizations.of(context)!.empty,
                                    style: TextStyle(
                                      color: FontColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  color: SkyeBlueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: RedBinColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/bin01.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 70,
                          width: 120,
                          child: Column(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.other,
                                style: TextStyle(
                                  color: FontblackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: _Bin4 == 1 ? FullColor : EmptyColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _Bin4 == 1
                                        ? AppLocalizations.of(context)!.full
                                        : AppLocalizations.of(context)!.empty,
                                    style: TextStyle(
                                      color: FontColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class historyscreen extends StatelessWidget {
  const historyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Grey2Color.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 20),
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/Clear.JPG',
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.typr +
                                ' : ' +
                                AppLocalizations.of(context)!.clear,
                            style: TextStyle(
                              color: FontblackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            AppLocalizations.of(context)!.bin_num + ' : 1',
                            style: TextStyle(
                              color: FontblackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Grey2Color.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 20),
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/Color.JPG',
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.typr +
                                ' : ' +
                                AppLocalizations.of(context)!.color,
                            style: TextStyle(
                              color: FontblackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            AppLocalizations.of(context)!.bin_num + ' : 2',
                            style: TextStyle(
                              color: FontblackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Grey2Color.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 20),
                      Container(
                        height: 80,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/Cloudy.JPG',
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.typr +
                                ' : ' +
                                AppLocalizations.of(context)!.cloudy,
                            style: TextStyle(
                              color: FontblackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            AppLocalizations.of(context)!.bin_num + ' : 3',
                            style: TextStyle(
                              color: FontblackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
