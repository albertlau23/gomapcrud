
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/shopping/ShoppingCartScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class ShoppingProductScreen extends StatefulWidget {
  final String heroTag,image;

  const ShoppingProductScreen({Key key, this.heroTag = "heroTag", this.image='./assets/images/shopping/product/product-3.jpg'})
      : super(key: key);

  @override
  _ShoppingProductScreenState createState() => _ShoppingProductScreenState();
}

class _ShoppingProductScreenState extends State<ShoppingProductScreen>
    with SingleTickerProviderStateMixin {
  ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    leading: InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(MdiIcons.chevronLeft),
                    ),
                    title: Text("Febreze AIR",
                        style: AppTheme.getTextStyle(
                            themeData.appBarTheme.textTheme.headline6,
                            fontWeight: 600)),
                    actions: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: MySize.size16),
                          child: Icon(MdiIcons.heartOutline, size: MySize.size22))
                    ],
                  ),
                  backgroundColor: themeData.backgroundColor,
                  body: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: MySize.size24),
                          child: Center(
                            child: Hero(
                              tag: widget.heroTag,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(MySize.size8)),
                                child: Image.asset(
                                  widget.image,
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size24),
                                  child: Text(
                                    "Rs. 1,500.00",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.headline6,
                                        fontWeight: 600,
                                        letterSpacing: 0),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: MySize.size16),
                                    child: Text(
                                      "Febreze AIR (blue edison)",
                                      style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 500,
                                      ),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16),
                                  child: Generator.buildRatingStar(
                                      rating: 4.5, spacing: 4, size: MySize.size24),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size8),
                                  padding: EdgeInsets.only(
                                      top: MySize.size4, bottom: MySize.size4, left: MySize.size12, right: MySize.size12),
                                  decoration: BoxDecoration(
                                      color: Generator.starColor.withAlpha(32),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size16))),
                                  child: Text("4.5 (27)",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: Generator.starColor)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(MySize.size8)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData.colorScheme.primary
                                        .withAlpha(24),
                                    blurRadius: 3,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(MySize.size8)),
                                color: themeData.colorScheme.primary,
                                splashColor: Colors.white.withAlpha(100),
                                highlightColor: themeData.colorScheme.primary,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShoppingCartScreen()));
                                },
                                padding: EdgeInsets.only(top: MySize.size12, bottom: MySize.size12),
                                child: Text(
                                  "BUY NOW",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 600,
                                      color: themeData.colorScheme.onPrimary,
                                      letterSpacing: 0.3),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size8),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(MySize.size8)),
                              ),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(MySize.size8)),
                                color: Colors.transparent,
                                splashColor: themeData.colorScheme.primary
                                    .withAlpha(100),
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShoppingCartScreen()));
                                },
                                padding: EdgeInsets.only(top: MySize.size12, bottom: MySize.size12),
                                child: Text(
                                  "ADD TO CART",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 600,
                                      color: themeData.colorScheme.primary,
                                      letterSpacing: 0.3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ));
      },
    );
  }
}
