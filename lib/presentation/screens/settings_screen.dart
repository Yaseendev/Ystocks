import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:stocks_market/blocs/theme_cubit/theme_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(8),
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          ListTileSwitch(
                value: Theme.of(context).brightness == Brightness.dark,
                leading: Icon(Theme.of(context).brightness == Brightness.dark
                    ? Icons.nightlight_round_rounded
                    : Icons.wb_sunny),
                onChanged: (mode) {
                  context.read<ThemeCubit>().toggleTheme();
                },
                visualDensity: VisualDensity.comfortable,
                switchType: SwitchType.material,
                switchActiveColor: Theme.of(context).primaryColor,
                title: Text('Dark Mode'),
              ),
        ],
        );
  }
}