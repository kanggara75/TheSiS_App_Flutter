import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';

class DeviceStatus extends StatefulWidget {
  @override
  _DeviceStatusState createState() => _DeviceStatusState();
}

class _DeviceStatusState extends State<DeviceStatus> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(200),
      width: getProportionateScreenWidth(150),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(2, 2, 2, 0),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 202, 255, 191)),
        borderRadius: BorderRadius.circular(5),
        color: Color.fromARGB(255, 202, 255, 191),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your Vehicle is\n",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              status ? "Active!" : "Inactive!",
              style: TextStyle(
                color: status ? Colors.blue : Colors.redAccent,
                fontSize: status ? 22 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
