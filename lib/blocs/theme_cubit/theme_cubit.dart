import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks_market/utils/locator.dart';
import 'package:stocks_market/utils/themes.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super((locator.get<SharedPreferences>().getBool('isDarkTheme') ?? false) ? AppTheme.darkThem : AppTheme.lightThem);

  void toggleTheme() => state == AppTheme.lightThem
      ? emit(AppTheme.darkThem)
      : emit(AppTheme.lightThem);
}
