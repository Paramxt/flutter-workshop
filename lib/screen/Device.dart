import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class sensorscreen extends StatefulWidget {
  const sensorscreen({super.key});

  @override
  State<sensorscreen> createState() => _sensorscreenState();
}

class _sensorscreenState extends State<sensorscreen> {
  @override
  Widget build(BuildContext context) {
    int _Bin1 = 1;
    int _Bin2 = 0;
    int _Bin3 = 0;
    int _Bin4 = 1;
    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2,
        children: <Widget>[
          GestureDetector(
            //Gride 1
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context)!.clear),
                        const SizedBox(width: 10),
                        Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: _Bin1 == 1 ? FullColor : EmptyColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: Text(
                                _Bin1 == 1
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
                      color: BlueBinColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
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
                        AppLocalizations.of(context)!.clear,
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
                          color: _Bin1 == 1 ? FullColor : EmptyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              _Bin1 == 1
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
                        Text(AppLocalizations.of(context)!.color),
                        const SizedBox(width: 10),
                        Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: _Bin2 == 1 ? FullColor : EmptyColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: Text(
                                _Bin2 == 1
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
                      padding: const EdgeInsets.all(7.0),
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
                        AppLocalizations.of(context)!.color,
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
                          color: _Bin2 == 1 ? FullColor : EmptyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              _Bin2 == 1
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
                        Text(AppLocalizations.of(context)!.cloudy),
                        const SizedBox(width: 10),
                        Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: _Bin3 == 1 ? FullColor : EmptyColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: Text(
                                _Bin3 == 1
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
              padding: const EdgeInsets.only(left: 7, top: 7, bottom: 7),
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
                      padding: const EdgeInsets.all(7.0),
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
                        AppLocalizations.of(context)!.cloudy,
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
                          color: _Bin3 == 1 ? FullColor : EmptyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              _Bin3 == 1
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
                            color: _Bin4 == 1 ? FullColor : EmptyColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: Text(
                                _Bin4 == 1
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
                      padding: const EdgeInsets.all(7.0),
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
                          color: _Bin4 == 1 ? FullColor : EmptyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              _Bin4 == 1
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
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
                      const SizedBox(width: 20),
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/Clear.JPG',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.typr} : ${AppLocalizations.of(context)!.clear}',
                            style: const TextStyle(
                              color: FontblackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${AppLocalizations.of(context)!.bin_num} : 1',
                            style: const TextStyle(
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
            const SizedBox(height: 20),
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
                      const SizedBox(width: 20),
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/Color.JPG',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.typr +
                                ' : ' +
                                AppLocalizations.of(context)!.color,
                            style: const TextStyle(
                              color: FontblackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            AppLocalizations.of(context)!.bin_num + ' : 2',
                            style: const TextStyle(
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
            const SizedBox(height: 20),
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
                      const SizedBox(width: 20),
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
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.typr +
                                ' : ' +
                                AppLocalizations.of(context)!.cloudy,
                            style: const TextStyle(
                              color: FontblackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            AppLocalizations.of(context)!.bin_num + ' : 3',
                            style: const TextStyle(
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
