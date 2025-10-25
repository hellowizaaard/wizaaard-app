import 'package:flutter/material.dart';

class DdcCustomWidget extends StatelessWidget {
  final double topPadding;

  const DdcCustomWidget({Key? key, this.topPadding = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Designed & Developed by'),
          const SizedBox(width: 8.0),
          Image.asset('assets/logo/ddc.png'),
        ],
      ),
    );
  }
}
