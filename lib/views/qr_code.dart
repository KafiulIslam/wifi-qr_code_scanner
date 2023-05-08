import 'package:flutter/material.dart';

class QRCode extends StatefulWidget {
  final String qrCode;
  final String qrLogo;
  const QRCode({Key? key, required this.qrCode, required this.qrLogo}) : super(key: key);

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.qrLogo, style: TextStyle(fontSize: 16),),
              Text(widget.qrCode, style: TextStyle(fontSize: 16),),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  IconButton(
                      onPressed: () {
                        //    Navigator.push(context, MaterialPageRoute(builder: (_) => const DataSafety()));
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
