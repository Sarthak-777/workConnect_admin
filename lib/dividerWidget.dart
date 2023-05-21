import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  String text;
  DividerWidget({Key? key, this.text = 'OR'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.blueGrey,
            indent: 10,
            endIndent: 10,
            thickness: 1,
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.blueGrey),
        ),
        Expanded(
          child: Divider(
            color: Colors.blueGrey,
            indent: 10,
            endIndent: 10,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
