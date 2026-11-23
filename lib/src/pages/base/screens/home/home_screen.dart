import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:fast_location/src/shared/metrics.dart';
import 'package:fast_location/src/shared/components/address_details_component/address_details_component.dart';

import 'package:fast_location/src/pages/base/screens/home/home_controller.dart';
import 'package:fast_location/src/pages/base/screens/home/form_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Material(
        child: Padding(
          padding: const EdgeInsets.all(Metrics.screenPadding),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: Metrics.sectionSpacing,
                children: [
                  FormComponent(
                    validateCep: _controller.validateCep,
                    submit: _controller.search,
                  ),
                  AddressDetailsComponent(address: _controller.address),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
