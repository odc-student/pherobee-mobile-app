import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/cubits/location/location_cubit.dart';
import 'package:pherobee/cubits/profile/profile_cubit.dart';
import 'package:pherobee/screens/home/widgets/farms_widget.dart';
import 'package:pherobee/screens/shared_widgets/navbar.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';

class CreateFarmScreen extends StatefulWidget {
  const CreateFarmScreen({super.key});

  @override
  State<CreateFarmScreen> createState() => _CreateFarmScreenState();
}

class _CreateFarmScreenState extends State<CreateFarmScreen> {
  final Map<String, Marker> _markers = {};


  TextEditingController nameController = TextEditingController();
  double long = 0;
  double lat=0;
  String place='Not yet selected';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Navbar(onTap: (int index) {},),
      body: SafeArea(
        child: Container(
          // color: Colors.grey,
          padding: EdgeInsets.all(context.high),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleWidget(title: "Create your own farm"),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              Container(
                color: Colors.grey,
                height: context.height * 0.5,
                width: context.width * 0.8,
                child: GoogleMap(
                  onTap: (argument) {
                    print(argument.latitude);
                    print(argument.longitude);
                    setState(() {
                      long=argument.longitude;
                      lat=argument.latitude;
                    });
                    context.read<LocationCubit>().loadLocation(argument.longitude.toString(), argument.latitude.toString());
                    setState(() {
                      long=argument.longitude;
                      lat=argument.latitude;
                    });
                    },
                  onMapCreated: (controller) =>
                  {
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(36.7888833, 9.4964024),
                    zoom: 9,
                  ),
                  markers: _markers.values.toSet(),
                ),
              ),
              BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  if(state is LocationLoaded) {
                    return Column(
                      children: [

                        Text(state.location.displayName??"invalid value please try again",textAlign: TextAlign.center,),
                  ButtonWidget(title: "Submit", onTap: () {
                  print("creating farm");
                  print("long$long");
                  print("lat$lat");

                  context.read<ProfileCubit>().createFarm(nameController.text, long, lat, state.location.displayName!);
                  print("Done");
                  Navigator.pop(context);
                  },)
                      ],
                    );
                  }else
                  {
                    return Text(place);
                  }
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}
