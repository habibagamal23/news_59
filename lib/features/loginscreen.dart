import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/router/constantrouter.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      context.go(ConstantRouter.homepath);
    }, child: Text("go to home"));
  }
}
