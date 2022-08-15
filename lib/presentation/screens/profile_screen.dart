import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_market/blocs/profile_bloc/profile_bloc.dart';

import '../widgets/profile/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  final String symbol;
  const ProfileScreen({Key? key, required this.symbol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        if (state is ProfileError) {
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: kNegativeColor,
            //   title: Text(':('),
            // ),
            // backgroundColor: kScaffoldBackground,
            body: Center(child: Text(state.errMessage)),
          );
        }
        if (state is ProfileLoaded) {
          return ProfileBody(
            profile: state.profile!,
            color: Colors.orange,
            //determineColorBasedOnChange(state.profileModel.stockProfile.changes),
          );
        }
        return Scaffold(
          appBar: AppBar(title: Text(symbol)),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
