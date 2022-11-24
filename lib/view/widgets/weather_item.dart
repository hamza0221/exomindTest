import 'package:exomind_test/model/city.dart';
import 'package:exomind_test/utils/global.dart';
import 'package:exomind_test/utils/infos_messages.dart';
import 'package:exomind_test/utils/project_style.dart';
import 'package:exomind_test/utils/size_config.dart';
import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  final City? city;

  WeatherItem({this.city});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      child: ListTile(
        leading: SizedBox(
            height: getProportionateScreenHeight(100),
            width: getProportionateScreenWidth(100), // fixed width and height
            child: Image.network('$imageAddress${city?.weather?.icon}.png')),
        title: Text("${city?.name}"),
        subtitle: Text(
          //display weather temperature + unity converted +linebreak + description
          '${city?.weather?.temp} $ceclius$lineBreak${city?.weather?.description}',
          style: ProjectStyle.styleblackWeath,
        ),
        isThreeLine: true,
      ),
    );
  }
}
