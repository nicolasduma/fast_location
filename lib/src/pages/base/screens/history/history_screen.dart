import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:fast_location/src/shared/colors.dart' as app_colors;
import 'package:fast_location/src/shared/metrics.dart';
import 'package:fast_location/src/shared/components/address_details_component/address_details_component.dart';

import 'package:fast_location/src/pages/base/screens/history/history_controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  final HistoryController _controller = HistoryController();

  @override
  void initState() {
    super.initState();
    _controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Material(
        child: Padding(
          padding: const EdgeInsets.all(Metrics.screenPadding),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                spacing: Metrics.sectionSpacing,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (final address in _controller.addresses)
                    Column(
                      spacing: Metrics.sectionSpacing,
                      children: [
                        AddressDetailsComponent(address: address),
                        SizedBox(
                          width: double.infinity,
                          height: 2,
                          child: Material(color: app_colors.Colors.secondary),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
