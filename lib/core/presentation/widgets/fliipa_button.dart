import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FliipaButton extends StatelessWidget {
  final String title;
  final double fontSize;
  final double padding;
  final GestureTapCallback onPressed;
  final IconData? icon;

  FliipaButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.icon,
      this.fontSize = 22.0,
      this.padding = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Theme.of(context).colorScheme.secondary,
      splashColor: Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon != null
                ? Icon(
                    icon,
                    color: Theme.of(context).colorScheme.secondaryVariant,
                  )
                : const SizedBox(),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              title,
              maxLines: 1,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  fontSize: fontSize),
            )
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
