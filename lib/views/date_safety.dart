import 'package:flutter/material.dart';
import 'package:wifi_qr_code/views/enter_password.dart';

class DataSafety extends StatelessWidget {
  final String wifiName;

  const DataSafety({Key? key, required this.wifiName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Safety'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Data Safety',
              style: TextStyle(fontSize: 35),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EnterPassword(
                                    wifiName: wifiName,
                                  )));
                    },
                    icon: Icon(Icons.arrow_forward_ios)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
