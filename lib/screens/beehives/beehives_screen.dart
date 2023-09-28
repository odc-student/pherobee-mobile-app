import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/models/beehive.dart';
import 'package:pherobee/models/beekeeper_profile.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';
import 'package:pherobee/utils/types.dart';

import '../../cubits/profile/profile_cubit.dart';
import '../shared_widgets/beehive_widget.dart';
import '../shared_widgets/navbar.dart';

class BeehivesScreen extends StatelessWidget {
  const BeehivesScreen({super.key, this.classifyBeehives});

  final ClassifyBeehives? classifyBeehives;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: const Navbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(context.medium),
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(
                        0, context.medium, 0, context.medium),
                    child: const TitleWidget(title: "My Beehives")),
                Text(
                  classifyBeehives!=null?"Beehives related to farms #${classifyBeehives!.relatedToFarms
                      .length}":"Beehives",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if(state is BeekeeperProfileLoaded){
                      print(state);
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                      ),
                      itemCount: classifyBeehives !=null ? classifyBeehives!.relatedToFarms.length:state.beekeeper!.beehives!.length,
                      itemBuilder: (context, index) {
                        Beehive beehive =  classifyBeehives !=null ?classifyBeehives
                            !.relatedToFarms[index]:state.beekeeper!.beehives![index];
                        return BeehiveWidget(
                          beehive: beehive,
                        );
                      },
                    );}
                    else {
                      return const Text("data");
                    }
                  },
                ),
                Text(
                  classifyBeehives!=null?"Beehives not related to farms #${classifyBeehives!.notRelatedToFarms
                      .length}":"Beehives",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                if(classifyBeehives!=null)GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                  ),
                  itemCount: classifyBeehives!.notRelatedToFarms.length,
                  itemBuilder: (context, index) {
                    Beehive beehive = classifyBeehives!.notRelatedToFarms[index];
                    return BeehiveWidget(beehive: beehive,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
