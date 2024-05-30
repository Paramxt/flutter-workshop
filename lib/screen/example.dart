import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_workshop/main.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_workshop/screen/Device.dart';

@RoutePage()
class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool isPoweredOn = true;
  int? _selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.home,
          style: TextStyle(
            fontSize: 22,
            color: FontblackColor,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06,
            left: (MediaQuery.of(context).size.width - 260) / 2,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 195, 243, 227),
                borderRadius: BorderRadius.circular(200),
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
                      Color.fromARGB(255, 255, 235, 59),
                      Color.fromARGB(255, 255, 241, 118),
                      Color.fromARGB(255, 66, 189, 65),
                      Color.fromARGB(255, 43, 175, 43),
                      Color.fromARGB(255, 10, 143, 8),
                    ],
                    shadowColor: Colors.white.withOpacity(0.5),
                    shadowMaxOpacity: 1,
                    gradientStartAngle: 1,
                    gradientEndAngle: 180,
                  ),
                  infoProperties: InfoProperties(
                    mainLabelStyle: TextStyle(
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
                onChange: (double value) => print(value),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.275,
            left: (MediaQuery.of(context).size.width - 90) / 2,
            child: Container(
              width: 90,
              height: 90,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (!states.contains(MaterialState.pressed)) {
                        return whiteColor;
                      }
                      return null;
                    },
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (!states.contains(MaterialState.pressed)) {
                        return isPoweredOn ? PrimaryColor : Colors.red;
                      }
                      return null;
                    },
                  ),
                ),
                onPressed: () {
                  print("Click Power");
                  setState(() {
                    isPoweredOn = !isPoweredOn;
                  });
                },
                child: Icon(
                  Icons.power_settings_new,
                  size: 40,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 25,
            right: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10),
                        Image.asset(
                          'assets/Stepper.png',
                          width: 30,
                          height: 30,
                        ),
                        Text(
                          AppLocalizations.of(context)!.step,
                          style: TextStyle(
                              fontSize: 16,
                              color: FontblackColor,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '20',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: var_device_Color,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: (MediaQuery.of(context).size.width - 130) / 2,
                  height: 45,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      Image.asset(
                        'assets/servo.png',
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(width: 5),
                      Text(
                        AppLocalizations.of(context)!.servo,
                        style: TextStyle(
                            fontSize: 16,
                            color: FontblackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '20',
                            style: TextStyle(
                                fontSize: 16,
                                color: var_device_Color,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(7),
                    child: Image.asset(
                      'assets/webcam2.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.48,
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
                      const SizedBox(height: 20),
                      ToggleSwitch(
                        minWidth: (MediaQuery.of(context).size.width),
                        cornerRadius: 8.0,
                        activeBgColors: [
                          [whiteColor],
                          [whiteColor]
                        ],
                        borderColor: [GreyColor],
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
                              return sensorscreen();
                            } else {
                              return historyscreen();
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: whiteColor,
        showUnselectedLabels: false,
        selectedItemColor: PrimaryColor,
        onTap: (index) {
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: AppLocalizations.of(context)!.info,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
