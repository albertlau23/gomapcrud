/*
* File : Simple Card 
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class SimpleCardWidget extends StatefulWidget {
  @override
  _SimpleCardWidgetState createState() => _SimpleCardWidgetState();
}

class _SimpleCardWidgetState extends State<SimpleCardWidget> {
  double _elevation = 2;

  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Simple Card",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    child: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: MySize.size16,
                          right: MySize.size16,
                          top: MySize.size12),
                      child: Row(
                        children: <Widget>[
                          Text("Elevation",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600)),
                          Slider(
                            value: _elevation,
                            min: 0,
                            max: 10,
                            label: _elevation.toStringAsFixed(1),
                            onChanged: (value) {
                              setState(
                                () {
                                  print(value);
                                  _elevation = value;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MySize.size16,
                          right: MySize.size16,
                          top: MySize.size16),
                      child: _SimpleCard(
                        elevation: _elevation,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(MySize.size16),
                        child: _CircularCard(
                          elevation: _elevation,
                        )),
                  ],
                ))));
      },
    );
  }
}

class _SimpleCard extends StatefulWidget {
  final double elevation;

  const _SimpleCard({Key key, this.elevation = 1}) : super(key: key);

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<_SimpleCard> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Card(
      elevation: widget.elevation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage("./assets/images/hotel/room-2.jpg"),
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.all(MySize.size16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Title",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle1,
                            fontWeight: 600)),
                    Text(
                        "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            height: 1.2,
                            fontWeight: 500)),
                    Container(
                      alignment: Alignment.centerRight,
                      child: OutlineButton(
                          visualDensity: VisualDensity.compact,
                          highlightColor: Colors.transparent,
                          borderSide: BorderSide.none,
                          splashColor:
                              themeData.colorScheme.primary.withAlpha(100),
                          onPressed: () {},
                          child: Text(
                            "ACTION",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.button,
                                fontWeight: 600,
                                color: themeData.colorScheme.primary),
                          )),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CircularCard extends StatefulWidget {
  final double elevation;

  const _CircularCard({Key key, this.elevation = 1}) : super(key: key);

  @override
  _CircularCardState createState() => _CircularCardState();
}

class _CircularCardState extends State<_CircularCard> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Card(
      elevation: widget.elevation,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage("./assets/images/hotel/room-3.jpg"),
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Title",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600)),
                      Text(
                          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              height: 1.2,
                              fontWeight: 500)),
                      Container(
                        alignment: Alignment.centerRight,
                        child: OutlineButton(
                            visualDensity: VisualDensity.compact,
                            highlightColor: Colors.transparent,
                            borderSide: BorderSide.none,
                            splashColor:
                                themeData.colorScheme.primary.withAlpha(100),
                            onPressed: () {},
                            child: Text(
                              "ACTION",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.button,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.primary),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
