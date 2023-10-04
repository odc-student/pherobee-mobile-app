import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/models/beekeeper_farm.dart';
import 'package:pherobee/models/beekeeper_profile.dart';
import 'package:pherobee/models/subowner.dart';
import 'package:pherobee/screens/beehives/beehives_screen.dart';
import 'package:pherobee/screens/farms/farm_screen.dart';
import 'package:pherobee/screens/home/widgets/farm_summary.dart';
import 'package:pherobee/screens/home/widgets/farms_widget.dart';
import 'package:pherobee/screens/home/widgets/global_state.dart';
import 'package:pherobee/screens/shared_widgets/navbar.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';
import 'package:pherobee/utils/types.dart';

import '../../cubits/profile/profile_cubit.dart';
import '../fake/home_screen.dart';
import '../shared_widgets/add_farm_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileNotLoaded) {
                // todo error screen
                return const Text("Profile not Loaded");
              } else if (state is ProfileLoading) {
                // todo loading screen
                return const CircularProgressIndicator();
              } else if (state is BeekeeperProfileLoaded) {

                final List<Subowner> subowners = state.beekeeper.subowners!
                    .getRange(
                    0,
                    state.beekeeper.subowners!.length >= 2
                        ? 2
                        : state.beekeeper.subowners!.length)
                    .toList();
                return Center(
                  child: SizedBox(
                    // height: context.height,
                    width: context.width * 0.9,
                    child: Column(
                      children: [

                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0, context.small, 0, context.small),
                          height: context.height * 0.15,
                          decoration: const BoxDecoration(
                              color: AppColors.blueColor3,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                        ),
                        GlobalStateHomeWidget(state: state),
                        FarmsUnitWidgets( state: state),

                      ],
                    ),
                  ),
                );
              } else if (state is ProfileError) {
                return ErrorToLoad(error: state.error);
              } else {
                return const Text("D5almna fl Else");
              }
            },
          ),
        ),
      ),
    );
  }
}

class SubownerHomeWidget extends StatelessWidget {
  const SubownerHomeWidget({super.key, required this.subowner});

  final Subowner subowner;

  //todo selecting a marker will show the name
  // https://nominatim.openstreetmap.org/reverse?format=xml&lat=52.5487429714954&lon=-1.81602098644987&zoom=18&addressdetails=1


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.small),
      margin: EdgeInsets.fromLTRB(0, context.small / 2, 0, context.small / 2),
      width: context.width * 0.9,
      height: context.height * 0.13,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: EdgeInsets.all(context.medium),
              decoration: BoxDecoration(
                  color: AppColors.thirdColor,
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                Icons.person,
                size: context.high * 2,
              )),
          SizedBox(
              width: context.width * 0.5, child: Text(subowner.email!)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    showModalBottomSheet(context: context,
                      builder: (context) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.photo),
                            title: const Text('Choose from Photos'),
                            onTap: () {
                              // Handle the photo selection
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.camera),
                            title: const Text('Take a Picture'),
                            onTap: () {
                              // Handle taking a picture
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ));
                  },
                  child: Icon(Icons.edit)),
              Icon(Icons.delete_sharp),
            ],
          ),
        ],
      ),
    );
  }
}
