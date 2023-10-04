
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/config/config.dart';

import '../../cubits/profile/profile_cubit.dart';

class AddSubownerDialog extends StatefulWidget {
  const AddSubownerDialog({
    super.key,
  });

  @override
  State<AddSubownerDialog> createState() => _AddSubownerDialogState();
}

class _AddSubownerDialogState extends State<AddSubownerDialog> {
  TextEditingController farmName = TextEditingController();
  TextEditingController farmLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Enter subowner details'),

          TextField(
            controller: farmName,
            decoration: const InputDecoration(labelText: 'Subowner mail'),
          ),
          TextField(
            controller: farmLocation,
            decoration: const InputDecoration(labelText: 'Subowner password'),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Access the input values
                  String mail = farmName.text;
                  String location = farmLocation.text;
                  // Do something with the input values
                  print('Input 1: $mail');
                  print('Input 2: $location');
                  context.read<ProfileCubit>().createSubowner(mail, location);
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Submit'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
