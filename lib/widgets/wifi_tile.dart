import 'package:flutter/material.dart';

class WifiTileWidget extends StatefulWidget {
  final String wifiName;
  final String wifiPass;
  final int? selectedTile;
  final int index;
  final VoidCallback? onTap;

  const WifiTileWidget(
      {Key? key,
        required this.wifiName,
        this.wifiPass = '',
        this.onTap,
        required this.selectedTile,
        required this.index})
      : super(key: key);

  @override
  _WifiTileWidgetState createState() => _WifiTileWidgetState();
}

class _WifiTileWidgetState extends State<WifiTileWidget> {
  late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.00),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 0,
                color: Color(0xFFE0E3E7),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Color(0xFF2FD106),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 9, 0, 9),
                  child: Container(
                    width: 3,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2FD106),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      // FFLocalizations.of(context).getText(
                      //   '0mifsw9z' /* WIFI */,
                      // ),
                      widget.wifiName,
                      style:   TextStyle(
                          color: Colors.black,
                          fontSize: widget.selectedTile == widget.index ? 22 : 20,
                          fontWeight: widget.selectedTile == widget.index ? FontWeight.w600 : FontWeight.w400),
                    ),
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.black,
                  ),
                  child: Checkbox(
                    tristate: true,
                    value: widget.selectedTile == widget.index ? true : false,
                    onChanged: (bool? newValue) async {
                      //setState(() =>  isChecked = newValue!);
                    },
                    activeColor: Color(0xFF2FD106),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}