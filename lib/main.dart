import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'injector.dart' as di;
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

import 'package:emodule_fe/util/routes/go_router_config.dart';
import 'package:emodule_fe/common/constants.dart';
import 'package:emodule_fe/common/utils.dart';

import 'package:emodule_fe/presentation/bloc/empty/empty_cubit.dart';

void main() async {
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.production");
  } else {
    await dotenv.load(fileName: ".env.development");
  }

  if (kIsWeb) {
    MetaSEO().config();
  }

  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  configureApp();

  await initializeDateFormatting('en_US', null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /// state navigation (provider and bloc)
      providers: [
        BlocProvider(create: (_) => di.getIt<EmptyCubit>()),
        // BlocProvider(create: (_) => di.getIt<DashboardCubit>()),
        // BlocProvider(create: (_) => di.getIt<IsScreenLockEnabled>()),
      ],
      child: MaterialApp.router(
        routerConfig: mainRouter,
        title: 'SD Islam Pembangunan',
        theme: ThemeData(
          primarySwatch: createMaterialColor(Constant.DS_PURPLE),
        ),
      ),
    );
  }
}
