import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:meta_seo/meta_seo.dart';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:emodule_fe/presentation/page/s/error_page.dart';
import 'package:emodule_fe/presentation/page/s/home_page.dart';

GoRouter mainRouter = GoRouter(
  errorBuilder: (context, state) => ErrorPageSmall(),
  routes: [
    GoRoute(
      name: "home_page",
      path: "/",
      builder: (context, state) {
        if (kIsWeb) {
          // MetaSEO meta = MetaSEO();
          //
          // meta.keyValue(key: 'og:url', value: 'https://pramuka.uinjkt.ac.id');
          // meta.keyValue(key: 'og:type', value: 'website');
          // meta.keyValue(key: 'og:title', value: 'Kami Ada Karena Semangat Kami! | Pramuka UIN Jakarta');
          // meta.keyValue(key: 'og:description', value: 'Pramuka UIN Jakarta merupakan salah satu Unit Kegiatan Khusus (UKK) yang berada pada pangkalan UIN Syarif Hidayatullah Jakarta');
          // meta.keyValue(key: 'og:image', value: 'https://drive.google.com/uc?export=view&id=1tHqmA_TvS-jqiL95tgidc2CjLGbjekhe');
          // meta.keyValue(key: 'og:image:type', value: 'image/png');
          // meta.keyValue(key: 'og:image:width', value: '400');
          // meta.keyValue(key: 'og:image:height', value: '400');

          // This is must be server rendered. Find a way to do it only for giving meta tags
        }
        return const MyHomePage();
      },
    ),
    //
    // GoRoute(
    //   name: "dashboard_page",
    //   path: "/dashboard",
    //   builder: (context, state) {
    //     return const StudentsDashboardPageSmall();
    //   },
    // ),
    //
    // GoRoute(
    //   name: "empty_page",
    //   path: "/empty",
    //   builder: (context, state) {
    //     return const emptyPageSmall();
    //   },
    // ),
  ],
);
