import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_market/blocs/market_bloc/market_bloc.dart';
import 'package:stocks_market/blocs/theme_cubit/theme_cubit.dart';
import 'package:stocks_market/presentation/widgets/home/home_laoding.dart';
import 'package:stocks_market/utils/constants.dart';
import '../widgets/home/market_movers_listview.dart';
import '../widgets/home/sector_performance_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // appBar: AppBar(
        //   actions: [
        //     IconButton(
        //         onPressed: () => context.read<ThemeCubit>().toggleTheme(),
        //         icon: const Icon(Icons.safety_divider))
        //   ],
        // ),
        BlocBuilder<MarketBloc, MarketState>(
            builder: (BuildContext context, MarketState state) {
      if (state is MarketInitial) {
        BlocProvider.of<MarketBloc>(context).add(LoadMarketsEvent());
      }
      if (state is MarketLoaded) {
        return RefreshIndicator(
          onRefresh: () {
            final homeBloc = BlocProvider.of<MarketBloc>(context);
            homeBloc.add(LoadMarketsEvent());
            return homeBloc.stream.firstWhere(
              (element) => element is MarketLoaded || element is MarketError,
            );
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 18),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SectorPerformanceWidget(
                  performanceData: state.sectorPerformance!),
              Divider(height: 2),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 8),
                child: Text('Most Active', style: TextStyles.kSubtitleStyling),
              ),
              MarketMoversListView(
                color: Color(0xFF263497),
                txtColor: Colors.white,
                stocks: state.marketActive ?? [],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('Top Gainers', style: TextStyles.kSubtitleStyling),
              ),
              MarketMoversListView(
                color: AppColors.kPositiveColor,
                stocks: state.marketGainer ?? [],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text('Top Losers', style: TextStyles.kSubtitleStyling),
              ),
              MarketMoversListView(
                color: Colors.red,
                stocks: state.marketLoser ?? [],
              ),
            ]),
          ),
        );
      }
      if (state is MarketError) {
        return Center(
          child: Text(
            state.errMessage,
            style: TextStyle(
                height: 1.5,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.kGray),
            textAlign: TextAlign.start,
          ),
        );
      }
      return HomeLoadingWidget();
      // Center(
      //   child: CircularProgressIndicator(),
      // );
    });
  }
}
