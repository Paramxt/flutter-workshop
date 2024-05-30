import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_workshop/main.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.noti,
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 14, 13, 13),
          ),
        ),
      ),
      backgroundColor: PrimaryColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 195, 243, 227),
            borderRadius: BorderRadius.circular(200),
            boxShadow: [
              BoxShadow(
                color: GreyColor.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SizedBox(
            width: 280,
            height: 280,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    customColors: CustomSliderColors(
                      trackColor: Colors.grey,
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
                    customWidths: CustomSliderWidths(
                      trackWidth: 25,
                      progressBarWidth: 25,
                      shadowWidth: 30,
                    ),
                  ),
                  initialValue: 60,
                  onChange: (double value) {
                    print(value);
                  },
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Set light\n60%',
                      style: TextStyle(
                        color: FontblackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
