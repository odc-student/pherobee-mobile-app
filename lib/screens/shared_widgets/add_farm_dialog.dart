import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';

import '../../cubits/profile/profile_cubit.dart';

class AddFarmBottomSheet extends StatefulWidget {
  const AddFarmBottomSheet({
    super.key,
  });

  @override
  State<AddFarmBottomSheet> createState() => _AddFarmBottomSheetState();
}

class _AddFarmBottomSheetState extends State<AddFarmBottomSheet> {
  TextEditingController farmName = TextEditingController();
  TextEditingController farmLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.thirdColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      padding: EdgeInsets.all(context.high),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const TitleWidget(title: 'Enter farm details'),
          TextField(
            controller: farmName,
            decoration: const InputDecoration(labelText: 'Farm Name'),
          ),
          TextField(
            controller: farmLocation,
            decoration: const InputDecoration(labelText: 'Farm Location'),
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
                  String name = farmName.text;
                  String location = farmLocation.text;
                  // context.read<ProfileCubit>().createFarm(name, location);
                  Navigator.of(context).pop();
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
