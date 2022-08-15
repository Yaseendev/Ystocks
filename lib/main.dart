import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'blocs/theme_cubit/theme_cubit.dart';
import 'utils/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'config.env');
  await Hive.initFlutter();
  await locatorsSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Stocks App',
            theme: state,
            onGenerateRoute: locator.get<FluroRouter>().generator,
          );
        },
      ),
    );
  }
}
