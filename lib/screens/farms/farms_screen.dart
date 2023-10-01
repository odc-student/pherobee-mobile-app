import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/cubits/profile/profile_cubit.dart';
import 'package:pherobee/models/beehive.dart';
import 'package:pherobee/screens/shared_widgets/app_bar_widget.dart';
import 'package:pherobee/screens/shared_widgets/beehive_widget.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';

import '../../config/colors.dart';
import '../../models/subowner.dart';
import '../shared_widgets/navbar.dart';

class FarmsScreen extends StatefulWidget {
  const FarmsScreen(
      {super.key,
      required this.beehives,
      required this.location,
      required this.name,
      required this.subowners,
      required this.sId});

  final List<Beehive> beehives;
  final String location;
  final String name;
  final List<Subowner> subowners;
  final String sId;

  @override
  State<FarmsScreen> createState() => _FarmsScreenState();
}

class _FarmsScreenState extends State<FarmsScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(context.height * 0.1),
            child: SafeArea(
                child: AppBarWidget(
              title: widget.name,
              location: widget.location,
            ))),
        body: SafeArea(child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is BeekeeperProfileLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(context.medium),
                    child: Column(
                      children: [
                        FarmsSubowners(widget: widget, state: state,),
                         Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Beehives",
                                  style: TextStyle(
                                    fontSize: context.medium * 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title:
                                                    const Text('Add Beehive'),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ...state.beekeeper.beehives!.where((element) => !widget.beehives.contains(element))
                                                        .map(
                                                      (e) => InkWell(
                                                          onTap: () {
                                                            context
                                                                .read<
                                                                    ProfileCubit>()
                                                                .associateBeehiveToFarm(
                                                                    widget.sId,
                                                                    e.sId!);
                                                          },
                                                          child: Text(
                                                              e.serialNumber!)),
                                                    )
                                                  ],
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Cancel'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: const Icon(Icons.add)),
                                  ],
                                ),
                              ],
                            ),
                            //todo to add a button with better design when no beehive or no subowenr in the field
                            if(widget.beehives.isNotEmpty)  GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.9,
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 0,
                                ),
                                itemCount: widget.beehives.length,
                                itemBuilder: (context, index) {
                                  Beehive e = widget.beehives[index];
                                  return BeehiveWidget(
                                    beehive: e,
                                  );
                                })
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              );
            } else {
              return const Text("Else farms screen");
            }
          },
        )));
  }
}

class FarmsSubowners extends StatelessWidget {
  const FarmsSubowners({
    super.key,
    required this.widget, required this.state,
  });

  final FarmsScreen widget;
  final BeekeeperProfileLoaded state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subowners",
              style: TextStyle(
                fontSize: context.medium * 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:
                                const Text('Add Subowner'),
                            content: Column(
                              mainAxisSize:
                                  MainAxisSize.min,
                              children: [
                                ...state
                                    .beekeeper.subowners!
                                    .where((element) =>
                                        !element
                                            .farmAccess!
                                            .contains(
                                                widget.sId))
                                    .map(
                                      (e) => Container(
                                          decoration: const BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          30)),
                                              color: AppColors
                                                  .thirdColor),
                                          padding: EdgeInsets
                                              .all(context
                                                  .medium),
                                          child: Column(
                                            children: [
                                              Text(
                                                  e.email!),
                                              Container(
                                                padding: EdgeInsets
                                                    .all(context
                                                        .small),
                                                decoration: const BoxDecoration(
                                                    color: AppColors
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.all(Radius.circular(90))),
                                                child: Icon(
                                                  Icons
                                                      .supervised_user_circle_sharp,
                                                  size:
                                                      context.high *
                                                          2,
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed:
                                                      () {
                                                    context.read<ProfileCubit>().associateFarmToSubowner(
                                                        e.sId!,
                                                        widget.sId);
                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                  child: const Text(
                                                      "Give access")),
                                            ],
                                          )),
                                    )
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop();
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
        if (state.beekeeper.subowners!
            .where((element) =>
                element.farmAccess!.contains(widget.sId))
            .isNotEmpty)
          SizedBox(
            width: context.width*0.9,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...state.beekeeper.subowners!
                      .where((element) => element.farmAccess!
                      .contains(widget.sId)).map((e) => SubownerUnit(e: e,sId: widget.sId,))
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class SubownerUnit extends StatelessWidget {
  const SubownerUnit({
    super.key,
    required this.sId, required this.e,
  });

  final String sId;
  final Subowner e;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.small),
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(30)),
        color: AppColors.thirdColor),
    padding: EdgeInsets.all(context.small),
    child: Column(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: [
        Text(e.email!),
        Container(
          padding:
          EdgeInsets.all(context.small),
          margin:
          EdgeInsets.all(context.small),
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(90))),
          child: Icon(
            Icons
                .supervised_user_circle_sharp,
            size: context.high * 2,
          ),
        ),
        TextButton(
          child: const Text("Remove access"),
          onPressed: () {
            context
                .read<ProfileCubit>()
                .deleteFarmFromSubowner(
                e.sId!, sId);
          },
        )
      ],
    ));
  }
}

// todo  this is the logic of adding a subowner
// InkWell(
// onTap: () {
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
// title: const Text('Add Subowner'),
// content: Column(
// mainAxisSize: MainAxisSize.min,
// children: [
// TextField(
// controller: emailController,
// decoration: const InputDecoration(
// labelText: 'Email'),
// ),
// TextField(
// controller: passwordController,
// obscureText: true,
// decoration: const InputDecoration(
// labelText: 'Password'),
// ),
// ],
// ),
// actions: [
// ElevatedButton(
// onPressed: () {
// //todo maybe add validators
// if (emailController.text.isEmpty ||
// passwordController.text.isEmpty) {
// Navigator.of(context).pop();
// } else {
// context
//     .read<ProfileCubit>()
//     .createSubowner(emailController.text,passwordController.text);
// // Perform login logic here with emailController.text and passwordController.text
// Navigator.of(context).pop();
// }
// },
// child: const Text('Add Subowner'),
// ),
// TextButton(
// onPressed: () {
// Navigator.of(context).pop();
// },
// child: const Text('Cancel'),
// ),
// ],
// );
// },
// );
// },
// child: const Icon(Icons.add)),
