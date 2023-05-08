import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_qr_code/views/qr_code.dart';
import '../controller/api/api.dart';

class EnterPassword extends StatefulWidget {
  final String wifiName;

  const EnterPassword({Key? key, required this.wifiName}) : super(key: key);

  @override
  State<EnterPassword> createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {

  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;
  bool isLoading = false;

  Future<bool> connectToWifi(String wifiName,
      String password,
      String encryption,) async {
    try {


      late NetworkSecurity security = NetworkSecurity.WPA;
      switch (encryption) {
        case 'WPA/WPA2':
          security = NetworkSecurity.WPA;
          break;
        case 'WEP':
          security = NetworkSecurity.WEP;
          break;
      }
      await WiFiForIoTPlugin.connect(wifiName,
          password: password, joinOnce: true, security: security);

      var response = await createQRCode(
          wifiName,
          password,
          'Wifi QR Code',
          encryption,
          '',
          '',
          '');

      var data = response['data'];

      if (response['status'] == 'success') {

        final qrCode = data['data']['base64'];
        final qrLogo = data['data']['qrcodeimage'];

        Navigator.push(context, MaterialPageRoute(
            builder: (_) => QRCode(qrCode: qrCode, qrLogo: qrLogo,)));
      } else {
        print('something went wrong in api ****');
      }

      //await WifiIot.connect(ssid, password);
      print('Connected to $wifiName');
      return true;
    } catch (e) {
      print('Error connecting to $wifiName: $e');
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Password'),
        centerTitle: true,
        leading: IconButton(onPressed: () async {
          var response =  await createQRCode(
              widget.wifiName,
              _passwordController.text,
              'Wifi QR Code',
              'WPA/WPA2',
              '',
              '',
              '');
        }, icon: Icon(Icons.add)),
      ),
      body: Center(
        child: isLoading == true ? const Center(
            child: CircularProgressIndicator()) : Column(
          children: [
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: 'Enter password'),
            ),
            //Radio(value: value, groupValue: groupValue, onChanged: onChanged),
            Checkbox(value: isChecked, onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            }),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                IconButton(
                    onPressed: () {
                      connectToWifi(widget.wifiName, _passwordController.text,
                          'WPA/WPA2');
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
