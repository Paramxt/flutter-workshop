import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/color.dart';

class EquipmentSwitch extends StatefulWidget {
  final bool value;
  final Function(bool) onChanged;

  const EquipmentSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<EquipmentSwitch> createState() => _EquipmentSwitchState();
}

class _EquipmentSwitchState extends State<EquipmentSwitch> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _isSelected,
      activeColor: PrimaryColor,
      onChanged: (newValue) {
        setState(() {
          _isSelected = newValue;
          widget.onChanged(newValue);
        });
      },
    );
  }
}

class Equipment {
  late final String name;
  bool isSelected = false;

  Equipment(
    this.name,
  );
}

List Equipments = [
  Equipment(' Light'),
  Equipment(' Servo Motor'),
  Equipment(' Stepper Motor'),
  Equipment(' Webcam'),
  Equipment(' Sensor'),
];
