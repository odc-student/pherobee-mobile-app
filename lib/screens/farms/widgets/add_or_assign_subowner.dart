import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/models/subowner.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';
import 'package:pherobee/utils/valid_mail.dart';

import '../../../cubits/profile/profile_cubit.dart';

class AddOrAssignSubowner extends StatefulWidget {
  const AddOrAssignSubowner({
    super.key,
    required this.subowners,
    required this.farmId,
  });

  final List<Subowner> subowners;
  final String farmId;

  @override
  State<AddOrAssignSubowner> createState() => _AddOrAssignSubownerState();
}

class _AddOrAssignSubownerState extends State<AddOrAssignSubowner> {
  String radio = "Add new subowner";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late List<String> subownerNames = [];
  late String selectedOption;
  late String firstOption;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    subownerNames = widget.subowners.map((e) => e.username!).toList();
    subownerNames.isEmpty? selectedOption = "Nothing to add":selectedOption = "-Select-";
    firstOption=selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    bool addSubowner = radio == "Add new subowner";
    // Initial dropdown selection
    return  Container(
      padding: EdgeInsets.all(context.high),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleWidget(title: 'Add Subowner'),
          RadioListTile(
              title: const Text("Add new subowner"),
              value: "Add new subowner",
              groupValue: radio,
              onChanged: (value) {
                setState(() {
                  radio = value.toString();
                });
              }),
          AnimatedOpacity(
            opacity: !addSubowner?0:1,
            duration:  !addSubowner?const Duration(milliseconds: 100):const Duration(milliseconds:500),
            child: AnimatedContainer(
              //todo animation custom page router builder
              duration: const Duration(milliseconds: 500),
              height: !addSubowner?0:context.height*0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    scrollPadding: EdgeInsets.all(context.height*0.4),
                    controller: nameController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Name',
                    ),
                    enabled: addSubowner, // Enable or disable based on isActive
                  ),
                  TextField(
                    scrollPadding: EdgeInsets.all(context.height*0.4),
                    controller: emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.mail),
                      labelText: 'Email',
                    ),
                    enabled: addSubowner, // Enable or disable based on isActive
                  ),
                  TextField(
                    scrollPadding: EdgeInsets.all(context.height*0.4),
                    controller: passwordController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      labelText: 'Password',
                    ),
                    enabled: addSubowner, // Enable or disable based on isActive
                    obscureText: true,
                  ),
                ],
              ),
            ),
          ),
          RadioListTile(
              title: const Text("Assign subowner"),
              value: "Assign subowner",
              groupValue: radio,
              onChanged: (value) {
                setState(() {
                  radio = value.toString();
                });
              }),
          DropdownButton<String>(
            value: selectedOption,
            onChanged: !addSubowner
                ? (value) {
                    setState(() {
                      selectedOption = value.toString();
                    });
                  }
                : null,
            items: [firstOption, ...subownerNames]
                .map<DropdownMenuItem<String>>((String value) {
              print("items ${ [selectedOption, ...subownerNames]}");
              return DropdownMenuItem<String>(
                value: value,
                child:
                    SizedBox(width: context.width * 0.35, child: Text(value)),
              );
            }).toList(),

            // Disable the dropdown based on isActive
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                  onPressed: () {
                    if(addSubowner ){
                      String name = nameController.text;
                      String email= emailController.text;
                      String password = passwordController.text;
                      if(isEmailValid(email)) {
                        context.read<ProfileCubit>().createSubownerAndAssignFarm(name, email, password, widget.farmId);
                      } else {
                        const snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Invalid Mail!'),
                          duration: Duration(seconds: 3), // Duration for how long the Snackbar is displayed
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }else {
                      context.read<ProfileCubit>().associateFarmToSubowner(
                          widget.subowners
                              .firstWhere((element) => element.username == selectedOption)
                              .sId!,
                          widget.farmId)


                      ;
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text("Submit")),
            ],
          )

        ],
      ),
    );
    

  }
}
// ...state.beekeeper.subowners!
//     .where((element) => !element.farmAccess!
//     .contains(widget.sId))
//     .map(
//       (e) => Container(
//       decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(
//               Radius.circular(30)),
//           color: AppColors.thirdColor),
//       padding:
//       EdgeInsets.all(context.medium),
//       child: Column(
//         children: [
//           Text(e.email!),
//           Container(
//             padding: EdgeInsets.all(
//                 context.small),
//             decoration: const BoxDecoration(
//                 color:
//                 AppColors.primaryColor,
//                 borderRadius:
//                 BorderRadius.all(
//                     Radius.circular(
//                         90))),
//             child: Icon(
//               Icons.person,
//               size: context.high * 2,
//             ),
//           ),
//         ],
//       )),
// )