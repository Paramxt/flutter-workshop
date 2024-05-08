import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_workshop/screen/Machine1.dart';
import 'package:flutter_workshop/screen/list_machine.dart';

class MachinePage extends StatefulWidget {
  const MachinePage({super.key});

  @override
  State<MachinePage> createState() => _MachinePageState();
}
class Equipment {
  late final String name;
  bool isSelected = false;

  Equipment(
    this.name,
  );
}
class _MachinePageState extends State<MachinePage> {
  bool isSelected = false;
  void itemSwitch(bool value) {
    setState(() {
      isSelected = !isSelected;
    });
  }


List Equipments = [
  Equipment(' Light'),
  Equipment(' Servo Motor'),
  Equipment(' Stepper Motor'),
  Equipment(' Webcam'),
  Equipment(' Sensor'),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.replaceNamed('/homedevice'),
        ),
        centerTitle: true,
        title: const Text(
          ' Machine #1',
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 14, 13, 13),
          ),
        ),
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemCount: Equipments.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                switch (Equipments[index].name) {
                  case ' Light':
                    return ListTile(
                      leading: Icon(Icons.lightbulb_outlined),
                      title: Text(Equipments[index].name),
                      subtitle: Text(
                          Equipments[index].isSelected ? " Online" : " Offline"),
                      trailing: EquipmentSwitch(
                        value: isSelected,
                        onChanged: (newValue) {
                          setState(() {
                            Equipments[index].isSelected = newValue;
                          });
                        },
                      ),
                    );
                  case ' Servo Motor':
                    return ListTile(
                      leading: Icon(Icons.build_rounded),
                      title: Text(Equipments[index].name),
                      subtitle: Text(
                          Equipments[index].isSelected ? " Online" : " Offline"),
                      trailing: EquipmentSwitch(
                        value: isSelected,
                        onChanged: (newValue) {
                          setState(() {
                            Equipments[index].isSelected = newValue;
                          });
                        },
                      ),
                    );
                  case ' Stepper Motor':
                    return ListTile(
                      leading: Icon(Icons.construction_rounded),
                      title: Text(Equipments[index].name),
                      subtitle: Text(
                          Equipments[index].isSelected ? " Online" : " Offline"),
                      trailing: EquipmentSwitch(
                        value: isSelected,
                        onChanged: (newValue) {
                          setState(() {
                            Equipments[index].isSelected = newValue;
                          });
                        },
                      ),
                    );
                  case ' Webcam':
                    return ListTile(
                      leading: Icon(Icons.camera_alt_outlined),
                      title: Text(Equipments[index].name),
                      subtitle: Text(
                          Equipments[index].isSelected ? " Online" : " Offline"),
                      trailing: EquipmentSwitch(
                        value: isSelected,
                        onChanged: (newValue) {
                          setState(() {
                            Equipments[index].isSelected = newValue;
                          });
                        },
                      ),
                    );
                  case ' Sensor':
                    return ListTile(
                      leading: Icon(Icons.cell_tower_rounded),
                      title: Text(Equipments[index].name),
                      subtitle: Text(" Click for more Detail."),
                      trailing: IconButton(
                        onPressed: () {
                          print('Click Sensor.');
                        },
                        icon: const Icon(Icons.navigate_next_sharp),
                        iconSize: 35,
                      ),
                    );
                }
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(color: Color.fromARGB(255, 210, 210, 210), height: 1),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
