import 'package:flutter/material.dart';
import 'package:stocks_market/data/models/profile/profile.dart';
import 'package:stocks_market/utils/constants.dart';
import 'package:stocks_market/utils/services/text_helper.dart';

class StatisticsWidget extends StatelessWidget {
  final Profile profile;
  const StatisticsWidget({Key? key, required this.profile}) : super(key: key);

  Text _renderText(dynamic text) {
    return text != null ? Text(compactText(text)) : Text('-');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text('Summary', style: TextStyles.kProfileScreenSectionTitle),
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Open', style: TextStyles.kSubtitleStyle),
                      trailing: _renderText(profile.stockQuote.open)),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title:
                          Text('Prev close', style: TextStyles.kSubtitleStyle),
                      trailing: _renderText(profile.stockQuote.previousClose)),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Day High', style: TextStyles.kSubtitleStyle),
                      trailing: _renderText(profile.stockQuote.dayHigh)),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Day Low', style: TextStyles.kSubtitleStyle),
                      trailing: _renderText(profile.stockQuote.dayLow)),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title:
                          Text('52 WK High', style: TextStyles.kSubtitleStyle),
                      trailing: _renderText(profile.stockQuote.yearHigh)),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title:
                          Text('52 WK Low', style: TextStyles.kSubtitleStyle),
                      trailing: _renderText(profile.stockQuote.dayLow)),
                ],
              ),
            ),
            SizedBox(width: 40),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Outstanding Shares',
                          style: TextStyles.kSubtitleStyle),
                      trailing:
                          _renderText(profile.stockQuote.sharesOutstanding)),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Volume', style: TextStyles.kSubtitleStyle),
                      trailing: _renderText(profile.stockQuote.volume)),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Avg Vol', style: TextStyles.kSubtitleStyle),
                      trailing: _renderText(profile.stockQuote.avgVolume)),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('MKT Cap', style: TextStyles.kSubtitleStyle),
                      trailing: _renderText(profile.stockQuote.marketCap)),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title:
                          Text('P/E Ratio', style: TextStyles.kSubtitleStyle),
                      trailing: _renderText(profile.stockQuote.pe)),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('EPS', style: TextStyles.kSubtitleStyle),
                      trailing: _renderText(profile.stockQuote.eps)),
                ],
              ),
            ),
          ],
        ),
        Divider(),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('CEO', style: TextStyles.kSubtitleStyle),
          trailing:
              Text(displayDefaultTextIfNull(profile.stockProfile.ceo ?? '')),
        ),
        Divider(),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Sector', style: TextStyles.kSubtitleStyle),
          trailing:
              Text(displayDefaultTextIfNull(profile.stockProfile.sector ?? '')),
        ),
        Divider(),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Exchange', style: TextStyles.kSubtitleStyle),
          trailing: Text('${profile.stockProfile.exchange}'),
        ),
        Divider(),
        Text('About ${profile.stockProfile.companyName ?? '-'} ',
            style: TextStyles.kProfileScreenSectionTitle),
        SizedBox(height: 8),
        Text(
          profile.stockProfile.description ?? '-',
          style: TextStyle(
              fontSize: 16, color: AppColors.kLighterGray, height: 1.75),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
