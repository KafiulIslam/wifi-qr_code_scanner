import 'package:flutter/material.dart';
import 'package:wifi_qr_code/views/choose_wifi.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),centerTitle: true,),
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ChooseWifi()));
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 200,
            color: Colors.green,
            child: const Text(
              'Create QR Code',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
