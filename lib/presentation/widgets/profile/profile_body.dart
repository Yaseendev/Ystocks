import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_market/blocs/profile_bloc/profile_bloc.dart';
import 'package:stocks_market/data/models/profile/profile.dart';

import 'profile_content_widget.dart';
import 'watchlist_button_widget.dart';

class ProfileBody extends StatefulWidget {
  final Color color;
  final Profile profile;
  final String symbol;
  const ProfileBody({
    Key? key,
    required this.profile,
    required this.color,
    this.symbol = '',
  }) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late bool isSaved;

  @override
  void initState() {
    isSaved = widget.profile.symbolSaved ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        centerTitle: true,
        title: Text(this.widget.profile.stockQuote.symbol ?? ''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          WatchlistButtonWidget(
            isSaved: isSaved,
            color: isSaved ? Colors.white : Color(0X88ffffff),
            onPressed: () {
             isSaved ? context
                  .read<ProfileBloc>()
                  .add(UnSaveProfileData(symbol: widget.symbol)) : context
                      .read<ProfileBloc>()
                      .add(SaveProfileData(symbol: widget.symbol));
              setState(() {
                isSaved = !isSaved;
              });
            },
          )
        ],
      ),
      body: ProfileContent(
        color: widget.color,
        profile: widget.profile,
      ),
    );
  }
}
