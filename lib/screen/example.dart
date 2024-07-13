import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/constants/color.dart';
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
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: whiteColor,
          showUnselectedLabels: false,
          selectedItemColor: PrimaryColor,
          onTap: (index) {
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.assignment),
              label: AppLocalizations.of(context)!.info,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: AppLocalizations.of(context)!.profile,
            ),
          ],
        ),
        backgroundColor: PrimaryColor,
        body: Stack(
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height * 0.06,
              left: 50,
              right: 50,
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 195, 243, 227),
                  borderRadius: BorderRadius.circular(
                      (MediaQuery.of(context).size.width - 100) / 2),
                  boxShadow: [
                    BoxShadow(
                      color: GreyColor.withOpacity(0.1),
                      spreadRadius: 30,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
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
                  onChange: (double value) => print(value),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.315,
              left: (MediaQuery.of(context).size.width - 90) / 2,
              child: SizedBox(
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
                  child: const Icon(
                    Icons.power_settings_new,
                    size: 40,
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.45,
              left: 5,
              right: 5,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: (MediaQuery.of(context).size.width / 2),
                      height: 45,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 10),
                          Image.asset(
                            'assets/stepper.png',
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            AppLocalizations.of(context)!.step,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '20',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue, // Adjust as needed
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width / 2),
                      height: 45,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 10),
                          Image.asset(
                            'assets/servo.png',
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            AppLocalizations.of(context)!.servo,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '20',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue, // Adjust as needed
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    // Third Container (Circle)
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
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
              maxChildSize: 0.4,
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
