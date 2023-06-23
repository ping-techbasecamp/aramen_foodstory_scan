import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanner')),
      body: MobileScanner(
        onDetect: (capture) async {
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty && barcodes[0].rawValue != null) {
            await scanQrFoodStory(barcodes[0].rawValue!).then(
              (value) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    body: Center(
                      child: InkWell(
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(
                              text: value,
                            ),
                          );
                        },
                        child: Text(
                          value.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

Future<dynamic> scanQrFoodStory(String qrcode) async {
  final decodedQr = base64Decode(qrcode);
  final decodedString = String.fromCharCodes(decodedQr);
  final response = await Dio().post(
      'https://aramen-invoicedata-api-nu6lzlrxlq-de.a.run.app/api/v1/scan',
      data: {'qrcode': decodedString}).then(
    (value) {
      return value.data;
    },
  );
  return response;
}
