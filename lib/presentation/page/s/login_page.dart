import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:emodule_fe/common/styles.dart';
import 'package:emodule_fe/common/constants.dart';
import 'package:emodule_fe/common/utils.dart';

import 'package:emodule_fe/presentation/widget/s/app_drawer.dart';
import 'package:emodule_fe/presentation/form/s/empty_form.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import 'package:meta_seo/meta_seo.dart';

class emptyPageSmall extends StatefulWidget {
  static String route = "/";
  const emptyPageSmall({
    Key? key,
  }) : super(key: key);

  @override
  State<emptyPageSmall> createState() => _emptyPageSmallState();
}

class _emptyPageSmallState extends State<emptyPageSmall> {
  // put it here so it can be recreated
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerSmall(),
      backgroundColor: Constant.LS_ECRU_WHITE,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Constant.DS_PURPLE),
                  ),
                ),

                child: Align(
                  alignment: Alignment.center,
                  child: Text('Welcome to SDIP Superapp!', style: ThemeText.heading_1_p),
                ),
              ),
              emptyForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Constant.DS_PURPLE),
                      padding: const EdgeInsets.all(8),
                      child: Text('© Tim IT SD Islam Pembangunan 2024',
                        style: ThemeText.standardMiniW,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    // Center(
    //   child: Container(
    //     decoration: BoxDecoration(
    //       border: Border(
    //         bottom: BorderSide(width: 1.0, color: Constant.DS_PURPLE),
    //       ),
    //     ),
    //     child: Center(
    //       child: Text('Selamat Datang', style: ThemeText.heading_1_p),
    //     ),
    //   ),
    // ),
    //
    // emptyForm(),
  }
}
