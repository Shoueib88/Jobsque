import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../consts/assets.dart';
import '../../consts/style.dart';
import 'countries.dart';

class ListOfCountries extends StatelessWidget {
  const ListOfCountries({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Countries(
                  countryicons: CountryIcons['usk'],
                  text: 'United States',
                  bordercolor: J.primaryColor,
                  color: J.activecolor,
                  width: 155),
              J.sizeboxw10,
              Countries(
                  countryicons: CountryIcons['ma'],
                  text: 'Malaysia',
                  bordercolor: J.greyColor.withOpacity(0.4),
                  color: J.greyColor.withOpacity(0.2),
                  width: 125)
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Countries(
                  countryicons: CountryIcons['sin'],
                  text: 'Singapore',
                  bordercolor: J.primaryColor,
                  color: J.activecolor,
                  width: 145),
              J.sizeboxw10,
              Countries(
                  countryicons: CountryIcons['indo'],
                  text: 'Indonesia',
                  bordercolor: J.primaryColor,
                  color: J.activecolor,
                  width: 145)
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Countries(
                  countryicons: CountryIcons['ph'],
                  text: 'Philiphines',
                  bordercolor: J.primaryColor,
                  color: J.activecolor,
                  width: 145),
              Countries(
                  countryicons: CountryIcons['po'],
                  text: 'Polandia',
                  bordercolor: J.greyColor.withOpacity(0.4),
                  color: J.greyColor.withOpacity(0.2),
                  width: 145)
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Countries(
                  countryicons: CountryIcons['india'],
                  text: 'India',
                  bordercolor: J.primaryColor,
                  color: J.activecolor,
                  width: 100),
              J.sizeboxw10,
              Countries(
                  countryicons: CountryIcons['vi'],
                  text: 'Vietnam',
                  bordercolor: J.greyColor.withOpacity(0.4),
                  color: J.greyColor.withOpacity(0.2),
                  width: 115),
              J.sizeboxw10,
              Countries(
                  countryicons: CountryIcons['ch'],
                  text: 'China',
                  bordercolor: J.greyColor.withOpacity(0.4),
                  color: J.greyColor.withOpacity(0.2),
                  width: 100)
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Countries(
                  countryicons: CountryIcons['ca'],
                  text: 'Canada',
                  bordercolor: J.primaryColor,
                  color: J.activecolor,
                  width: 145),
              J.sizeboxw10,
              Countries(
                  countryicons: CountryIcons['ar'],
                  text: 'Saudi Arabia',
                  bordercolor: J.primaryColor,
                  color: J.activecolor,
                  width: 165)
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Countries(
                  countryicons: CountryIcons['arg'],
                  text: 'Argentina',
                  bordercolor: J.greyColor.withOpacity(0.4),
                  color: J.greyColor.withOpacity(0.2),
                  width: 150),
              J.sizeboxw10,
              Countries(
                  countryicons: CountryIcons['pr'],
                  text: 'Brazil',
                  bordercolor: J.greyColor.withOpacity(0.4),
                  color: J.greyColor.withOpacity(0.2),
                  width: 130)
            ]),
          ]),
    );
  }
}
