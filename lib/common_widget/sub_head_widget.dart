import 'package:flutter/material.dart';
import 'package:qtech_jubayer_bin_montasir/helpers/colors.dart';

class Subhead extends StatelessWidget {
  String? title;
  String? subTitle;
  VoidCallback? onTap;

  Subhead({this.title, this.subTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 16),
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                subTitle!,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
