import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/cubits/profile/profile_cubit.dart';
import 'package:pherobee/models/subowner.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';
import 'package:pherobee/utils/types.dart';

import '../../home/widgets/farms_widget.dart';

class SubownerUnit extends StatelessWidget {
  const SubownerUnit({
    super.key,
    required this.sId,
    required this.e,
  });

  final String sId;
  final Subowner e;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        showDialog(
          // shape: const RoundedRectangleBorder(
          //   // <-- SEE HERE
          //   borderRadius: BorderRadius.vertical(
          //     top: Radius.circular(25.0),
          //   ),
          // ),
          context: context,
          builder: (context) => Dialog(child: EditDeleteSubowner(subowner: e)),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(context.small),
            margin: EdgeInsets.all(context.small),
            decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(90))),
            child: Icon(
              Icons.person,
              size: context.high * 2,
            ),
          ),
          Text(e.email!),
          TextButton(
            child: const Text("Remove access"),
            onPressed: () {
              context.read<ProfileCubit>().deleteFarmFromSubowner(e.sId!, sId);
            },
          )
        ],
      ),
    );
  }
}

class EditDeleteSubowner extends StatefulWidget {
  const EditDeleteSubowner({
    super.key,
    required this.subowner,
  });

  final Subowner subowner;

  @override
  State<EditDeleteSubowner> createState() => _EditDeleteSubownerState();
}

class _EditDeleteSubownerState extends State<EditDeleteSubowner> {
  late TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: widget.subowner.username);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height*0.5,
      padding: EdgeInsets.all(context.high),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const Row(
            children: [
              TitleWidget(title: "Edit Subowner"),
            ],
          ),
          TextField(
            controller: nameController,

            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Edit Name',
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Save"),
              ),
              ListTile(
                leading: Icon(Icons.remove_circle_outline_outlined),
                title: Text("Remove Access"),
              ),
              ListTile(
                leading: Icon(Icons.delete_forever),
                title: Text("Delete Permanently"),
              )
            ],
          ),
        ],
      ),
      // color: Colors.red,
    );
  }
}
