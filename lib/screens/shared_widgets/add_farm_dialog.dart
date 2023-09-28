
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/profile/profile_cubit.dart';

class AddFarmDialog extends StatefulWidget {
  const AddFarmDialog({
    super.key,
  });

  @override
  State<AddFarmDialog> createState() => _AddFarmDialogState();
}

class _AddFarmDialogState extends State<AddFarmDialog> {
  TextEditingController farmName = TextEditingController();
  TextEditingController farmLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter farm details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: farmName,
            decoration: const InputDecoration(labelText: 'Farm Name'),
          ),
          TextField(
            controller: farmLocation,
            decoration: const InputDecoration(labelText: 'Farm Location'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Access the input values
            String name = farmName.text;
            String location = farmLocation.text;
            // Do something with the input values
            print('Input 1: $name');
            print('Input 2: $location');
            context.read<ProfileCubit>().createFarm(name, location);
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
