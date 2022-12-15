import 'package:flutter/material.dart';

import 'dialogTextFieldWidget.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    Key? key,
    required this.streetController,
    required this.buildingController,
    required this.floorController,
    required this.apartmentController,
  }) : super(key: key);
  final TextEditingController streetController;
  final TextEditingController buildingController;
  final TextEditingController floorController;
  final TextEditingController apartmentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DialogTextFieldWidget(
          text: 'Street',
          controller: streetController,
          validator: (street) => street != null && street.length < 6
              ? 'Enter a valid Street'
              : null,
        ),
        DialogTextFieldWidget(
          text: 'Building',
          controller: buildingController,
          validator: (building) => building != null && building.length < 1
              ? 'Enter a valid Building'
              : null,
        ),
        DialogTextFieldWidget(
          text: 'Floor',
          controller: floorController,
          validator: (floor) =>
              floor != null && floor.length < 1 ? 'Enter a valid Floor' : null,
        ),
        DialogTextFieldWidget(
          text: 'Apartment',
          controller: apartmentController,
          validator: (apartment) => apartment != null && apartment.length < 1
              ? 'Enter a valid Apartment'
              : null,
        ),
      ],
    );
  }
}
