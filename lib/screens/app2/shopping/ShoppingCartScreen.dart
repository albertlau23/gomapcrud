import 'dart:ui';
import 'package:UIKit/screens/app2/shopping/ShoppingCheckoutScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: SafeArea(
              child: Scaffold(
                  key: _scaffoldKey,
                  body: Container(
                    color: customAppTheme.bgLayer1,
                    child: ListView(
                      padding: EdgeInsets.only(
                        top: MySize.size24,
                      ),
                      children: <Widget>[
                        SingleCartItem(
                          themeType: themeType,
                          image:
                              './assets/images/shopping/product/product-1.jpg',
                          price: 19.99,
                          name: "Pumpkin\nCream",
                          initialAmount: 2,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: SingleCartItem(
                            themeType: themeType,
                            image:
                                './assets/images/shopping/product/product-2.jpg',
                            price: 27.89,
                            name: "Carrom\nRoll",
                            initialAmount: 1,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: SingleCartItem(
                            themeType: themeType,
                            image:
                                './assets/images/shopping/product/product-5.jpg',
                            price: 39.79,
                            name: "Other\nSeed",
                            initialAmount: 3,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: MySize.size24,
                              right: MySize.size24,
                              top: MySize.size16),
                          child: Divider(),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: MySize.size24,
                              right: MySize.size24,
                              top: MySize.size16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Discount",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 600,
                                    muted: true),
                              ),
                              Text("-\$9.99",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600,
                                      letterSpacing: 0,
                                      muted: true))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: MySize.size24,
                              right: MySize.size24,
                              top: MySize.size16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Total",
                                style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  fontWeight: 700,
                                  color: themeData.colorScheme.onBackground,
                                ),
                              ),
                              Text("\$79.99",
                                  style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 700,
                                    color: themeData.colorScheme.onBackground,
                                    letterSpacing: 0,
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(MySize.size24),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(MySize.size4)),
                            color: themeData.colorScheme.primary.withAlpha(220),
                            splashColor: Colors.white.withAlpha(100),
                            highlightColor:
                                themeData.colorScheme.primary.withAlpha(220),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingCheckoutScreen()));
                            },
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Checkout".toUpperCase(),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          letterSpacing: 0.5,
                                          fontWeight: 600,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: MySize.size12,
                                      right: MySize.size12,
                                      top: MySize.size6,
                                      bottom: MySize.size6),
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.primary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size4))),
                                  child: Icon(
                                    MdiIcons.cartArrowRight,
                                    color: themeData.colorScheme.onPrimary,
                                    size: MySize.size18,
                                  ),
                                )
                              ],
                            ),
                            padding: EdgeInsets.only(
                                top: MySize.size8,
                                bottom: MySize.size8,
                                right: MySize.size16),
                          ),
                        )
                      ],
                    ),
                  )),
            ));
      },
    );
  }
}

class SingleCartItem extends StatefulWidget {
  final String image, name;
  final double price;
  final int themeType, initialAmount;

  const SingleCartItem(
      {Key key,
      this.image,
      this.name,
      this.price,
      this.themeType = 1,
      this.initialAmount = 1})
      : super(key: key);

  @override
  _SingleCartItemState createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  bool visible = true;

  int amount;

  @override
  void initState() {
    super.initState();
    amount = widget.initialAmount;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    customAppTheme = AppTheme.getCustomAppTheme(widget.themeType);

    return visible
        ? Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: MySize.size8,
                    color: customAppTheme.shadowColor,
                    offset: Offset(0, MySize.size4))
              ],
            ),
            margin: EdgeInsets.only(left: MySize.size24, right: MySize.size24),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                color: customAppTheme.bgLayer2,
              ),
              secondaryBackground: Container(
                color: customAppTheme.bgLayer2,
                padding: EdgeInsets.symmetric(horizontal: MySize.size0),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: MySize.size16),
                      padding: EdgeInsets.all(MySize.size10),
                      decoration: BoxDecoration(
                          color: customAppTheme.colorError.withAlpha(36),
                          shape: BoxShape.circle),
                      child: Icon(
                        MdiIcons.deleteOutline,
                        size: MySize.size26,
                        color: customAppTheme.colorError,
                      ),
                    ),
                  ],
                ),
              ),
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  setState(() {
                    //perform delete operation
                    setState(() {
                      visible = false;
                    });
                  });
                }
              },
              key: UniqueKey(),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: themeData.cardTheme.shadowColor.withAlpha(10),
                          blurRadius: MySize.size16)
                    ],
                    color: customAppTheme.bgLayer1,
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size16))),
                padding: EdgeInsets.only(right: MySize.size16),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.asset(
                        widget.image,
                        height: MySize.safeWidth * 0.3,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MySize.safeWidth * 0.3,
                        margin: EdgeInsets.only(left: MySize.size24),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  widget.name,
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600),
                                ),
                                Text(
                                  "\$" + "${widget.price}",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600,
                                      letterSpacing: -0.2,
                                      muted: true),
                                ),
                              ],
                            )),
                            Container(
                              child: Text(
                                "$amount",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.headline6,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 600),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MySize.size24),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        amount++;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(MySize.size6),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: customAppTheme.bgLayer3,
                                          boxShadow: [
                                            BoxShadow(
                                                color: themeData
                                                    .cardTheme.shadowColor
                                                    .withAlpha(8),
                                                blurRadius: MySize.size8)
                                          ]),
                                      child: Icon(
                                        MdiIcons.plus,
                                        size: MySize.size20,
                                        color:
                                            themeData.colorScheme.onBackground,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (amount > 1) amount--;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(MySize.size6),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: customAppTheme.bgLayer3,
                                          boxShadow: [
                                            BoxShadow(
                                                color: themeData
                                                    .cardTheme.shadowColor
                                                    .withAlpha(10),
                                                blurRadius: MySize.size8)
                                          ]),
                                      child: Icon(
                                        MdiIcons.minus,
                                        size: MySize.size20,
                                        color:
                                            themeData.colorScheme.onBackground,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
