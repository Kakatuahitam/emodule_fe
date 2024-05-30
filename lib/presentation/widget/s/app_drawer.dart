import 'package:flutter/material.dart';

import 'package:emodule_fe/common/constants.dart';
import 'package:emodule_fe/common/styles.dart';

// import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:change_case/change_case.dart';

class AppDrawerSmall extends StatefulWidget {
  const AppDrawerSmall({Key? key}) : super(key: key);

  @override
  State<AppDrawerSmall> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawerSmall> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (BuildContext) => EmptyCubit(),
    //   child: Drawer(
    //     child: ListView(
    //       padding: EdgeInsets.zero,
    //       children: [
    //         _Divider(),
    //         _Copyright(),
    //       ],
    //     ),
    //   ),
    // );
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerHeader(),
          _HomeButton(),
          _emptyButton(),
          _ProfileButton(),

          _Divider(),
          _DashboardButton(),

          _Divider(),
          _Copyright(),
        ],
      ),
    );
  }
  Widget _DrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(color: Constant.DS_PURPLE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            // backgroundImage: ExactAssetImage('images/icons/tunas_kelapa_240px_circ.png'),
            backgroundColor: Constant.LS_ECRU_WHITE,
            radius: 32.0,
          ),
          const SizedBox(height: 8.0),
          Text('Welcome {username}!', style: ThemeText.subtitleW),
          Text('{role}', style: ThemeText.standardNormalW),
        ],
      ),
    );
  }

  Widget _HomeButton() {
    return ListTile(
      title: Row(
        children: [
          Text('Home', style: ThemeText.standardNormalP),
        ],
      ),
      onTap: () {
        context.goNamed('home_page');
      },
    );
  }

  Widget _emptyButton() {
    return ListTile(
      title: Row(
        children: [
          Text('Masuk', style: ThemeText.standardNormalP),
        ],
      ),
      onTap: () {
        context.goNamed('empty_page');
      },
    );
  }

  Widget _LogoutButton() {
    return ListTile(
      title: Row(
        children: [
          Text('Keluar', style: ThemeText.standardNormalP),
        ],
      ),
      onTap: () {
        context.pushReplacementNamed('logout');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Logout berhasil"),
          ),
        );
      },
    );
  }

  // Widget _emptyOrLogoutButton() {
  //   return BlocBuilder<EmptyCubit, emptyState>(
  //     builder: (context, state) {
  //       context.read<EmptyCubit>().checkIfLoggedIn();
  //
  //       if (state is LoggedInState) {
  //         return _LogoutButton();
  //       } else if (state is LoggedOutState){
  //         return _emptyButton();
  //       } else {
  //         return _emptyButton();
  //       }
  //     }
  //   );
  // }

  Widget _ProfileButton() {
    return ListTile(
      title: Row(
        children: [
          Text('My Profile', style: ThemeText.standardNormalP),
        ],
      ),
      onTap: () {
        context.goNamed('profile_page');
      },
    );
  }

  Widget _DashboardButton() {
    return ListTile(
      title: Row(
        children: [
          Text('Dashboard', style: ThemeText.standardNormalP),
        ],
      ),
      onTap: () {
        context.goNamed('dashboard_page');
      },
    );
  }

  Widget _Empty() {
    return const SizedBox(height: 0);
  }

  Widget _Divider() {
    return const Divider(thickness: 2);
  }

  Widget _Copyright() {
    return ListTile(
      title: Text('© IT Division of SD Islam Pembangunan 2024', style: ThemeText.standardMiniP)
    );
  }
}
