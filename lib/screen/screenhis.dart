import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenHis extends StatefulWidget {
  const ScreenHis({super.key});

  @override
  State<ScreenHis> createState() => _ScreenHisState();
}

class _ScreenHisState extends State<ScreenHis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: GreyColor.withOpacity(0.08),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.info,
          style: TextStyle(
            fontSize: 22,
            color: Color.fromARGB(255, 14, 13, 13),
          ),
        ),
      ),
      body: const TypePlasticScreen(),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
    required this.descriptions,
    this.imagebottle,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
  String descriptions;
  List<String>? imagebottle;
}

const imageUrls = [
  ["path/to/image1.jpg", "path/to/image2.jpg"],
  ["path/to/image3.jpg"],
  null,
  ["path/to/image4.jpg", "path/to/text/image5.png"],
];

List<Item> generateItems(int numberOfItems) {
  const prefixes = [
    "Clear Plastic",
    "Color Plastic",
    "Cloudy Plastic ",
    "Other"
  ];
  const descriptions = [
    "- Bin number 1, clear Polyethylene Terephthalate.\n- Easy to recycle.\n- Processing synthetic fibers.",
    "- Bin number 2, color Polyethylene Terephthalate.\n- Difficult to recycle.\n- Separate pigments before processing.",
    "- Bin number 2, cloudy High-density Polyethylene.\n- High melting point.\n- It must be ground into small pieces..",
    "- Bin number 4 will be the bin that accepts sorting items other than the previous three bin, such as cans, glasses, cardboard boxes, etc.",
  ];

  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Type of Bin number ${index + 1}',
      expandedValue: '${prefixes[index]}',
      descriptions: '${descriptions[index]}',
    );
  });
}

class TypePlasticScreen extends StatefulWidget {
  const TypePlasticScreen({super.key});

  @override
  State<TypePlasticScreen> createState() => _TypePlasticScreenState();
}

class _TypePlasticScreenState extends State<TypePlasticScreen> {
  final List<Item> _data = generateItems(4);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.headerValue,
                style: TextStyle(fontSize: 17),
              ),
            );
          },
          body: ListTile(
            title: Text(
              item.expandedValue,
              style: TextStyle(fontSize: 17),
            ),
            subtitle: Text(
              item.descriptions,
              style: TextStyle(fontSize: 16),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
