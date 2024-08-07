import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:flutter_workshop/router/routes.gr.dart';

// @RoutePage()
// class AdddevicePage extends StatefulWidget {
//   final int countDevice;
//   const AdddevicePage({Key? key, required this.countDevice}) : super(key: key);

//   @override
//   State<AdddevicePage> createState() => _adddeviceRouteState();
// }

// class _adddeviceRouteState extends State<AdddevicePage> {
//   final _formKey = GlobalKey<FormState>();
//   String _scanBarcode = 'Unknown';
//   final _serialNum = TextEditingController();
//   String? _errorMessage;

//   @override
//   void dispose() {
//     _serialNum.dispose();
//     super.dispose();
//   }

//   Future<void> scanBarcode() async {
//     try {
//       String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//         '#ff6666',
//         'Cancel',
//         true,
//         ScanMode.BARCODE,
//       );
//       debugPrint(barcodeScanRes);
//       setState(() {
//         _scanBarcode = barcodeScanRes;
//       });
//     } catch (e) {
//       setState(() {
//         _scanBarcode = 'Error: $e';
//       });
//     }
//   }

//   void _connect() {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _errorMessage = null;
//       });
//       if (_serialNum.text == 'admin') {
//         context.router.replace(HomeDeviceRoute(countDevice: 1));
//       } else {
//         setState(() {
//           _errorMessage = AppLocalizations.of(context)!.not_found;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _Heightbox = 50.0;
//     return Scaffold(
//       backgroundColor: GreyColor.withOpacity(0.3),
//       appBar: AppBar(
//         backgroundColor: BottomColor2,
//         title: Text(
//           AppLocalizations.of(context)!.adddevice,
//           style: const TextStyle(
//             fontSize: 24,
//             color: SecondaryColor,
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             final updatedCountDevice = widget.countDevice + 1;
//             context.router.replace(
//               HomeDeviceRoute(
//                 countDevice: 0,
//               ),
//             );
//           },
//         ),
//       ),
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.center,
//                 child: Column(
//                   children: <Widget>[
//                     const SizedBox(height: 20.0),
//                     Text(
//                       AppLocalizations.of(context)!.textscan,
//                       style: const TextStyle(
//                           fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 25.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         print('Click Scan bar code');
//                         scanBarcode();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: SecondaryColor,
//                       ),
//                       child: Text(
//                         AppLocalizations.of(context)!.clickscan,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: PrimaryColor, fontSize: 18.0),
//                       ),
//                     ),
//                     const SizedBox(height: 25.0),
//                     Text(
//                         '${AppLocalizations.of(context)!.scanresult} : $_scanBarcode\n',
//                         style: const TextStyle(fontSize: 20)),
//                     Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment.center, // Center the content
//                       children: [
//                         const Spacer(),
//                         const Expanded(
//                           flex: 10,
//                           child: Divider(
//                             thickness: 1.5,
//                             color: SecondaryColor,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                           child: Text(
//                             AppLocalizations.of(context)!.or,
//                             style: const TextStyle(
//                                 color: SecondaryColor, fontSize: 17),
//                           ),
//                         ),
//                         const SizedBox(height: 25),
//                         const Expanded(
//                           flex: 10,
//                           child: Divider(
//                             thickness: 1.5,
//                             color: SecondaryColor,
//                           ),
//                         ),
//                         const Spacer(),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       AppLocalizations.of(context)!.enterserial,
//                       style: const TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 25.0),
//                     Form(
//                         key: _formKey,
//                         child: Column(
//                           children: <Widget>[
//                             TextFormField(
//                               controller: _serialNum,
//                               decoration: InputDecoration(
//                                 labelText:
//                                     AppLocalizations.of(context)!.enterserial,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return AppLocalizations.of(context)!
//                                       .pls_serial;
//                                 }
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 30),
//                             ElevatedButton(
//                               onPressed: _connect,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: SecondaryColor,
//                                 minimumSize: Size(double.infinity, _Heightbox),
//                               ),
//                               child: Text(
//                                 AppLocalizations.of(context)!.connect,
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                     color: Color.fromARGB(255, 78, 181, 145),
//                                     fontSize: 18.0),
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//                             if (_errorMessage != null)
//                               Text(
//                                 _errorMessage!,
//                                 style: const TextStyle(
//                                     color: Color.fromARGB(255, 255, 28, 12)),
//                               ),
//                             const SizedBox(height: 56),
//                           ],
//                         ))
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

@RoutePage()
class AdddevicePage extends StatefulWidget {
  final int countDevice;
  const AdddevicePage({Key? key, required this.countDevice}) : super(key: key);

  @override
  State<AdddevicePage> createState() => _adddeviceRouteState();
}

class _adddeviceRouteState extends State<AdddevicePage> {
  final _formKey = GlobalKey<FormState>();
  String _scanBarcode = 'Unknown';
  final _serialNum = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _serialNum.dispose();
    super.dispose();
  }

  Future<void> scanBarcode() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      debugPrint(barcodeScanRes);
      setState(() {
        _scanBarcode = barcodeScanRes;
      });
    } catch (e) {
      print('Error scanning barcode: $e');
      setState(() {
        _scanBarcode = 'Error: $e';
      });
    }
  }

  void _connect() {
    print('Click Connect Device');
    if (_formKey.currentState!.validate()) {
      setState(() {
        _errorMessage = null;
      });
      if (_serialNum.text == 'admin') {
        context.router.replace(HomeDeviceRoute(countDevice: 1));
      } else {
        setState(() {
          _errorMessage = AppLocalizations.of(context)!.not_found;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _Heightbox = 50.0;
    return Scaffold(
      backgroundColor: GreyColor.withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: BottomColor2,
        title: Text(
          AppLocalizations.of(context)!.adddevice,
          style: TextStyle(
            fontSize: 24,
            color: SecondaryColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final updatedCountDevice = widget.countDevice + 1;
            context.router.replace(
              HomeDeviceRoute(
                countDevice: 0,
              ),
            );
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    Text(
                      AppLocalizations.of(context)!.textscan,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25.0),
                    ElevatedButton(
                      onPressed: () {
                        print('Click Scan bar code');
                        scanBarcode();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: SecondaryColor,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.clickscan,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: PrimaryColor, fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Text(
                        AppLocalizations.of(context)!.scanresult +
                            ' : $_scanBarcode\n',
                        style: TextStyle(fontSize: 20)),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center the content
                      children: [
                        Spacer(),
                        Expanded(
                          flex: 10,
                          child: Divider(
                            thickness: 1.5,
                            color: SecondaryColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            AppLocalizations.of(context)!.or,
                            style:
                                TextStyle(color: SecondaryColor, fontSize: 17),
                          ),
                        ),
                        SizedBox(height: 25),
                        Expanded(
                          flex: 10,
                          child: Divider(
                            thickness: 1.5,
                            color: SecondaryColor,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.enterserial,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25.0),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _serialNum,
                              decoration: InputDecoration(
                                labelText:
                                    AppLocalizations.of(context)!.enterserial,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .pls_serial;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: _connect,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: SecondaryColor,
                                minimumSize: Size(double.infinity, _Heightbox),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.connect,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 78, 181, 145),
                                    fontSize: 18.0),
                              ),
                            ),
                            const SizedBox(height: 15),
                            if (_errorMessage != null)
                              Text(
                                _errorMessage!,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 28, 12)),
                              ),
                            const SizedBox(height: 56),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
