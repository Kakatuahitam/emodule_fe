import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:emodule_fe/common/styles.dart';
import 'package:emodule_fe/common/constants.dart';
import 'package:emodule_fe/common/utils.dart';

import 'package:emodule_fe/presentation/widget/s/app_drawer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import 'package:meta_seo/meta_seo.dart';

class MyHomePage extends StatefulWidget {
  static String route = "/";
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // put it here so it can be recreated
  @override
  Widget build(BuildContext context) {
    bool buttonEnabled = true;
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: SizedBox(
          height: 100.0,
          // child: Image.asset('images/icons/pramukajaksel.png', width: 140)
        ),
      ),
      drawer: AppDrawerSmall(),
      backgroundColor: Constant.LS_ECRU_WHITE,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: buttonEnabled ? () => {
                context.goNamed('students_dashboard_page'),
              } : null,

              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              child: Text('Students Dashboard', style: ThemeText.standardFormFieldP),
            ),
          ],
        ),
      ),
    );
  }
}
