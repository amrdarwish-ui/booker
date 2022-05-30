import 'package:booker/consts.dart';
import 'package:flutter/material.dart';

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: primaryColor,
      height: 0,
      thickness: 1,
    );
  }
}
