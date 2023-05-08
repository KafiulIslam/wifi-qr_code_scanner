import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_qr_code/views/date_safety.dart';
import '../model/wifi_model.dart';
import '../widgets/wifi_tile.dart';

class ChooseWifi extends StatefulWidget {
  const ChooseWifi({Key? key}) : super(key: key);

  @override
  State<ChooseWifi> createState() => _ChooseWifiState();
}

class _ChooseWifiState extends State<ChooseWifi> {

  late List<WifiModel> allAvailableWifiList = [];
  late int? selectedTile = null;
  late String _ssid = '';
  late String _password = '';

  Future<List<WifiNetwork>> loadAvailableWifiList() async {
    List<WifiNetwork> htResultNetwork;
    try {
      htResultNetwork = await WiFiForIoTPlugin.loadWifiList();
      for (var element in htResultNetwork) {
        setState(() {
          allAvailableWifiList.add(WifiModel(
            ssid: element.ssid ?? '',
            password: element.password ?? '',
            bssid: element.bssid ?? '',
          ));
        });
      }
    } on PlatformException {
      htResultNetwork = <WifiNetwork>[];
    }

    return htResultNetwork;
  }

  @override
  void initState() {
    loadAvailableWifiList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Wifi'),centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: allAvailableWifiList.length,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 8.0,
              ),
              itemBuilder: (BuildContext context, int  index) {
                var _data = allAvailableWifiList[index];
                return WifiTileWidget(
                    wifiName: _data.ssid,
                    wifiPass: _data.bssid,
                    onTap: () {
                      setState(() {
                        selectedTile = index;
                        _ssid = _data.ssid;
                        _password = _data.password;
                      });
                    },
                    index: index,
                    selectedTile: selectedTile
                );
              },
            ),
          Row(children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios)),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => DataSafety(wifiName: _ssid,)));
            }, icon: Icon(Icons.arrow_forward_ios)),
          ],)
        ],),
      ),
    );
  }
}
