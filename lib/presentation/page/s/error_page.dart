import 'package:flutter/material.dart';
import 'package:emodule_fe/common/styles.dart';
import 'package:emodule_fe/common/constants.dart';

import 'package:emodule_fe/presentation/widget/s/app_drawer.dart';

class ErrorPageSmall extends StatelessWidget{
  const ErrorPageSmall({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 100.0,
          // child: Image.asset('images/icons/pramukauinjkt48px.png', width: 48, height: 48)
        ),
      ),
      drawer: AppDrawerSmall(),
      backgroundColor: Constant.LS_ECRU_WHITE,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Constant.LS_ECRU_WHITE),
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      // child: Image.asset('images/rafakacamata.png', height: 120),
                    ),

                    // ignore: prefer_adjacent_string_concatenation
                    Text('Yah error, kami minta maaf yaa :(',
                      style: ThemeText.standardNormalP,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
