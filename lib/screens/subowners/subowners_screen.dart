import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/shared_widgets/add_subowner_dialog.dart';
import 'package:pherobee/screens/shared_widgets/navbar.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';

import '../../config/colors.dart';
import '../../cubits/profile/profile_cubit.dart';

class SubownersScreen extends StatelessWidget {
  const SubownersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const TitleWidget(title: "Subowners"),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is BeekeeperProfileLoaded) {
                if (state.beekeeper.subowners!.isNotEmpty) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(context.small),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.primaryColor),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => const AddSubownerDialog(),
                            );
                          },
                          child: Text(
                            "Create Subowner",
                            style: TextStyle(
                                fontSize: context.small * 1.5,
                                fontWeight: FontWeight.w500,
                                color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                      ...state.beekeeper.subowners!.map((e) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(e.email!),
                              const Icon(Icons.delete_sharp)
                            ],
                          ))
                    ],
                  );
                } else {
                  return const Text("No subowners");
                }
              } else {
                return const Text("data");
              }
            },
          )
        ],
      )),
    );
  }
}
