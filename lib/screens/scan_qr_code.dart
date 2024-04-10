import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:login/widgets/custom_scaffold.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrresult = 'Scanned data will appear here';
  Future<void> scanQR() async {
    try {
      final qrcode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        this.qrresult = qrcode.toString();
      });
    } on PlatformException {
      qrresult = 'Failed to read QR code';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Text(
                  '$qrresult',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  scanQR();
                },
                child: Text('Scan Code'))
          ],
        ),
      ),
    );
  }
}
