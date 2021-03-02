
import 'package:UIKit/screens/app2/shopping/ShoppingAddressScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';
import 'ShoppingCouponScreen.dart';
import 'ShoppingOrderPlaceScreen.dart';

class ShoppingCheckoutScreen extends StatefulWidget {
  @override
  _ShoppingCheckoutScreenState createState() => _ShoppingCheckoutScreenState();
}

class _ShoppingCheckoutScreenState extends State<ShoppingCheckoutScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  int _selectedOption = 1;

  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: Scaffold(
                backgroundColor: customAppTheme.bgLayer3,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: customAppTheme.bgLayer3,
                  leading: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  centerTitle: true,
                  title: Text("Checkout",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 600)),
                ),
                body: ListView(
                  padding: EdgeInsets.only(
                      left: MySize.size16,
                      right: MySize.size16,
                      bottom: MySize.size16),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: customAppTheme.bgLayer2,
                          borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size4)),
                          boxShadow: [
                            BoxShadow(
                                color: themeData.cardTheme.shadowColor
                                    .withAlpha(4),
                                blurRadius: 2)
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: MySize.size32),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.clockOutline,
                                    size: MySize.size22,
                                    color: themeData.colorScheme.primary,
                                  ),
                                  Container(
                                      margin:
                                      EdgeInsets.only(left: MySize.size8),
                                      child: Text(
                                        "2-3 Days",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600,
                                            muted: true),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size32),
                            child: Text(
                              "Toffee Bakery",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  fontWeight: 600,
                                  letterSpacing: 0.3),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingAddressScreen()));
                            },
                            child: Container(
                              margin: EdgeInsets.all(MySize.size16),
                              padding: EdgeInsets.all(MySize.size20),
                              decoration: BoxDecoration(
                                  color: customAppTheme.bgLayer1,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size4)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: themeData.cardTheme.shadowColor
                                            .withAlpha(10),
                                        blurRadius: 8)
                                  ]),
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size4)),
                                    child: Image.asset(
                                      './assets/other/map-snap.png',
                                      height: MySize.size64,
                                      width: MySize.getScaledSizeWidth(86),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: MySize.size64,
                                      margin:
                                      EdgeInsets.only(left: MySize.size16),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "West Drive",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle1,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 600),
                                          ),
                                          Text(
                                            "14, 921 Section",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground
                                                    .withAlpha(150),
                                                fontWeight: 500),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: MySize.size4),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: <Widget>[
                                                Icon(
                                                  MdiIcons.informationOutline,
                                                  color: themeData
                                                      .colorScheme.onBackground.withAlpha(200),
                                                  size: MySize.size10,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: MySize.size4),
                                                  child: Text(
                                                    "Tap to change",
                                                    style: AppTheme.getTextStyle(
                                                        themeData
                                                            .textTheme.caption,
                                                        fontSize: 9,
                                                        fontWeight: 400,
                                                        color: themeData
                                                            .colorScheme
                                                            .onBackground),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Order",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600),
                          ),
                          Text(
                            " - 2 Item",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(150),
                                fontWeight: 500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      padding: EdgeInsets.all(MySize.size16),
                      decoration: BoxDecoration(
                          color: customAppTheme.bgLayer2,
                          borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size4)),
                          boxShadow: [
                            BoxShadow(
                                color: themeData.cardTheme.shadowColor
                                    .withAlpha(4),
                                blurRadius: 2)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(MySize.size16),
                            decoration: BoxDecoration(
                                color: customAppTheme.bgLayer1,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size4)),
                                boxShadow: [
                                  BoxShadow(
                                      color: themeData.cardTheme.shadowColor
                                          .withAlpha(10),
                                      blurRadius: 8)
                                ]),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text("Yellow Cake",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          letterSpacing: 0,
                                          fontWeight: 600)),
                                ),
                                Text("\$12.99",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color: themeData.colorScheme.primary,
                                        fontWeight: 600))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size8),
                            padding: EdgeInsets.all(MySize.size16),
                            decoration: BoxDecoration(
                                color: customAppTheme.bgLayer1,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size4)),
                                boxShadow: [
                                  BoxShadow(
                                      color: themeData.cardTheme.shadowColor
                                          .withAlpha(10),
                                      blurRadius: 8)
                                ]),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text("Colorful Sandal",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          letterSpacing: 0,
                                          fontWeight: 600)),
                                ),
                                Text("\$29.99",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color: themeData.colorScheme.primary,
                                        fontWeight: 600))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "FLAT40",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color:
                                              themeData.colorScheme.onBackground,
                                              fontWeight: 600,
                                              ),
                                        ),
                                        Text("- 40% at max 100\$",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,fontSize: 12,
                                                color:
                                                themeData.colorScheme.onBackground,
                                                fontWeight: 400,letterSpacing: -0.2))
                                      ],
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ShoppingCouponScreen()));
                                      },
                                      child: Text(
                                        "Change coupon",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData.colorScheme.primary,letterSpacing: 0,
                                            fontWeight: 600),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size8),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Charges",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              muted: true,
                                              letterSpacing: 0,
                                              fontWeight: 600)),
                                      Text("\$ 4.00",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0,
                                              muted: true,
                                              fontWeight: 600)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size8),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Total",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0,
                                              fontWeight: 700)),
                                      Text("\$ 43.99",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0,
                                              fontWeight: 700)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(MySize.size8),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: themeData
                                                      .cardTheme.shadowColor
                                                      .withAlpha(8),
                                                  blurRadius: 4)
                                            ],
                                            color: customAppTheme.bgLayer1,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(MySize.size4))),
                                        child: Text(
                                          "VISA",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0.4,
                                              fontWeight: 900),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                        EdgeInsets.only(left: MySize.size8),
                                        child: Text(
                                          "\u2022\u2022\u2022\u2022  7983",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              muted: true,
                                              fontWeight: 600,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                            onTap: () {
                                              paymentMethod(context);
                                            },
                                            child: Text(
                                              "Change",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText2,
                                                  color: themeData
                                                      .colorScheme.primary,
                                                  letterSpacing: 0,
                                                  fontWeight: 600),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        color: themeData.colorScheme.primary,
                        splashColor: themeData.splashColor,
                        highlightColor: themeData.colorScheme.primary,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  ShoppingOrderPlaceScreen()));
                        },
                        child: Text(
                          "Place Order"
                              .toUpperCase(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              letterSpacing: 0.6,
                              fontWeight: 600,
                              color: themeData.colorScheme.onPrimary),
                        ),
                        padding: EdgeInsets.only(
                            top: MySize.size16, bottom: MySize.size16),
                      ),
                    )
                  ],
                )));
      },
    );
  }

  void paymentMethod(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                decoration: BoxDecoration(
                    color: themeData.backgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MySize.size16),
                        topRight: Radius.circular(MySize.size16))),
                padding: EdgeInsets.symmetric(
                    vertical: MySize.size24, horizontal: MySize.size8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: MySize.size16),
                      child: Text(
                        "Select Option"
                            .toUpperCase(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            fontWeight: 600,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(220)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedOption = 0;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: MySize.size4, right: MySize.size4),
                                  child: optionWidget(
                                    iconData: MdiIcons.bankOutline,
                                    text: "Bank",
                                    isSelected: _selectedOption == 0,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedOption = 1;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: MySize.size4, right: MySize.size4),
                                  child: optionWidget(
                                    iconData: MdiIcons.creditCardOutline,
                                    text: "Card",
                                    isSelected: _selectedOption == 1,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedOption = 2;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: MySize.size4, right: MySize.size4),
                                  child: optionWidget(
                                    iconData: MdiIcons.qrcode,
                                    text: "QR",
                                    isSelected: _selectedOption == 2,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedOption = 3;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: MySize.size4, right: MySize.size4),
                                  child: optionWidget(
                                    iconData: MdiIcons.cashMarker,
                                    text: "COD",
                                    isSelected: _selectedOption == 3,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Widget optionWidget({IconData iconData, String text, bool isSelected}) {
    return Container(
      margin: EdgeInsets.only(left: MySize.size4, right: MySize.size4),
      decoration: BoxDecoration(
        color: isSelected
            ? themeData.colorScheme.primary
            : themeData.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
        boxShadow: [
          BoxShadow(
            color: themeData.cardTheme.shadowColor.withAlpha(24),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(MySize.size8),
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            color: isSelected
                ? themeData.colorScheme.onPrimary
                : themeData.colorScheme.onBackground,
            size: 30,
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size8),
            child: Text(
              text,
              style: AppTheme.getTextStyle(
                themeData.textTheme.caption,
                fontWeight: 600,
                color: isSelected
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
    );
  }
}
