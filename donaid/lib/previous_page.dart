import 'package:flutter/material.dart';
import 'package:donaid/theme.dart';

var previouspage = Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                  //  onPressed: () {Scaffold.of(context).openDrawer(); },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            );