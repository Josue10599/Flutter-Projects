import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  FancyButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.deepOrange,
      splashColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.exposure_plus_1,
              color: Colors.amber,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              "ADD ONE",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
