import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class ShoppingProductReviewScreen extends StatefulWidget {
  @override
  _ShoppingProductReviewScreenState createState() =>
      _ShoppingProductReviewScreenState();
}

class _ShoppingProductReviewScreenState
    extends State<ShoppingProductReviewScreen>
    with SingleTickerProviderStateMixin {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder:
          (BuildContext buildContext, AppThemeNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        themeData = AppTheme.getThemeFromThemeMode(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: customAppTheme.bgLayer2,
                    elevation: 0,
                    leading: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        MdiIcons.chevronLeft,
                        color: themeData.colorScheme.onBackground,
                      ),
                    ),
                    title: Text("Reviews",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 600)),
                  ),
                  backgroundColor: customAppTheme.bgLayer2,
                  body: Container(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "4.0",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.headline4,
                                    letterSpacing: 0.5,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 700),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size8),
                                child: Generator.buildRatingStar(
                                    rating: 4.0,
                                    activeColor: Generator.starColor,
                                    inactiveColor: customAppTheme.bgLayer4,
                                    size: MySize.size24,
                                    spacing: 1,
                                    inactiveStarFilled: true),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size4),
                                child: Text(
                                  "Based on 23 reviews",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      letterSpacing: 0,
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(200)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MySize.size16,
                              left: MySize.size24,
                              right: MySize.size24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Excellent",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(180),
                                        fontWeight: 500,
                                        letterSpacing: 0),
                                  ),
                                  Container(
                                    child: Generator.buildProgress(
                                        progress: 85,
                                        activeColor: Colors.green,
                                        inactiveColor: customAppTheme.bgLayer3,
                                        width: MySize.safeWidth -
                                            MySize.getScaledSizeWidth(150),
                                        height: MySize.size4),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Good",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(180),
                                          fontWeight: 500,
                                          letterSpacing: 0),
                                    ),
                                    Container(
                                      child: Generator.buildProgress(
                                          progress: 65,
                                          activeColor: Colors.lightGreen,
                                          inactiveColor:
                                              customAppTheme.bgLayer3,
                                          width: MySize.safeWidth -
                                              MySize.getScaledSizeWidth(150),
                                          height: MySize.size4),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Average",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(180),
                                          fontWeight: 500,
                                          letterSpacing: 0),
                                    ),
                                    Container(
                                      child: Generator.buildProgress(
                                          progress: 45,
                                          activeColor: Colors.orangeAccent,
                                          inactiveColor:
                                              customAppTheme.bgLayer3,
                                          width: MySize.safeWidth -
                                              MySize.getScaledSizeWidth(150),
                                          height: MySize.size4),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Below Average",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(180),
                                          fontWeight: 500,
                                          letterSpacing: 0),
                                    ),
                                    Container(
                                      child: Generator.buildProgress(
                                          progress: 12,
                                          activeColor: Colors.orange,
                                          inactiveColor:
                                              customAppTheme.bgLayer3,
                                          width: MySize.safeWidth -
                                              MySize.getScaledSizeWidth(150),
                                          height: MySize.size4),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Poor",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(180),
                                          fontWeight: 500,
                                          letterSpacing: 0),
                                    ),
                                    Container(
                                      child: Generator.buildProgress(
                                          progress: 25,
                                          activeColor: Colors.red,
                                          inactiveColor:
                                              customAppTheme.bgLayer3,
                                          width: MySize.safeWidth -
                                              MySize.getScaledSizeWidth(150),
                                          height: MySize.size4),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MySize.size32,
                              left: MySize.size24,
                              right: MySize.size24),
                          child: Column(
                            children: <Widget>[
                              _singleReview(
                                  image: "./assets/images/avatar-4.jpg",
                                  name: "Tegan Payne",
                                  rating: 5,
                                  review: Generator.getDummyText(32),
                                  time: "1 day ago"),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size24),
                                child: _singleReview(
                                    image: "./assets/images/avatar-3.jpg",
                                    name: "Jamal Rossi",
                                    rating: 4,
                                    review: Generator.getDummyText(25),
                                    time: "7 days ago"),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size24),
                                child: _singleReview(
                                    image: "./assets/images/avatar-2.jpg",
                                    name: "Harvie Duncan",
                                    rating: 4,
                                    review: Generator.getDummyText(30),
                                    time: "1 month ago"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: Center(
                            child: OutlineButton(
                              borderSide: BorderSide.none,
                              splashColor:
                                  themeData.colorScheme.primary.withAlpha(100),
                              highlightColor: customAppTheme.bgLayer2,
                              onPressed: () {},
                              child: Text(
                                "Write a Review",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.primary,
                                    fontWeight: 600),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ));
      },
    );
  }

  Widget _singleReview(
      {String image, String name, double rating, String time, String review}) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: MySize.size36,
                height: MySize.size36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: MySize.size8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Generator.buildRatingStar(
                                rating: rating,
                                activeColor: Generator.starColor,
                                showInactive: false,
                                spacing: 0),
                            Container(
                                margin: EdgeInsets.only(left: MySize.size4),
                                child: Text(
                                  rating.toString(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                time,
                style: AppTheme.getTextStyle(
                  themeData.textTheme.caption,
                  muted: true,
                  fontWeight: 600,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size8),
            child: Text(
              "- " + review,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 500, color: themeData.colorScheme.onBackground),
            ),
          )
        ],
      ),
    );
  }
}
