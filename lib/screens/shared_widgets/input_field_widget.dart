import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';

import '../../config/colors.dart';

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget({
    super.key,
    required this.controller, required this.icon, required this.hint, required this.isPass,
  });

  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final bool isPass;

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {


  bool hidden = false;
  @override
  void initState() {

    hidden = widget.isPass;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width*0.8,
      margin: EdgeInsets.fromLTRB(0,context.medium,0,context.medium),
      decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.all(context.small),
      child: TextField(

        obscureText: hidden ,
        controller: widget.controller,
        decoration: InputDecoration(
            suffixIcon:widget.isPass? IconButton(
                onPressed: () => setState(() {
                  hidden = !hidden;
                }),
                icon: const Icon(Icons.remove_red_eye_outlined)):null,
            icon: Icon(widget.icon),
            border: InputBorder.none,
            hintText: widget.hint),
      ),
    );
  }
}
