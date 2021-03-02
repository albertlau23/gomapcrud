import 'package:UIKit/screens/app2/shopping/ShoppingAddCardScreen.dart';
import 'package:UIKit/screens/app2/shopping/ShoppingFavouriteScreen.dart';
import 'package:UIKit/screens/app2/shopping/ShoppingMegaMenuScreen.dart';
import 'package:UIKit/screens/app2/shopping/ShoppingOrderScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';
import 'ShoppingCategoryScreen.dart';
import 'ShoppingChatScreen.dart';

class ShoppingProfileScreen extends StatefulWidget {
  final BuildContext rootContext;

  const ShoppingProfileScreen({Key key, @required this.rootContext})
      : super(key: key);

  @override
  _ShoppingProfileScreenState createState() => _ShoppingProfileScreenState();
}

class _ShoppingProfileScreenState extends State<ShoppingProfileScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  body: ListView(
                padding: EdgeInsets.all(MySize.size24),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: MySize.size16),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MySize.size80,
                          height: MySize.size80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage("./assets/images/avatar-3.jpg"),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size8),
                          child: Text("Derrick Malone",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  fontWeight: 600,
                                  letterSpacing: 0)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size24),
                    padding: EdgeInsets.only(
                        left: MySize.size16,
                        top: MySize.size8,
                        bottom: MySize.size8,
                        right: MySize.size16),
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size4))),
                    child: Row(
                      children: <Widget>[
                        Icon(MdiIcons.informationOutline,
                            color: themeData.colorScheme.onPrimary,
                            size: MySize.size18),
                        Container(
                          margin: EdgeInsets.only(left: MySize.size16),
                          child: Text(
                            "Gold member",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: Generator.goldColor,
                                fontWeight: 600,
                                letterSpacing: 0.2),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Upgrade",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  color: themeData.colorScheme.onPrimary,
                                  fontWeight: 600,
                                  letterSpacing: 0.2),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size24),
                    child: Column(
                      children: <Widget>[
                        singleOption(
                            iconData: MdiIcons.shapeOutline,
                            option: "Category",
                            navigation: ShoppingCategoryScreen()),
                        Divider(),
                        singleOption(
                            iconData: MdiIcons.contentPaste,
                            option: "History",
                            navigation: ShoppingOrderScreen()),
                        Divider(),
                        singleOption(
                            iconData: MdiIcons.heartOutline,
                            option: "Favourite",
                            navigation: ShoppingFavouriteScreen()),
                        Divider(),
                        singleOption(
                            iconData: MdiIcons.creditCardOutline,
                            option: "Payment",
                            navigation: ShoppingAddCardScreen()),
                        Divider(),
                        singleOption(
                            iconData: MdiIcons.menu,
                            option: "Mega Menu",
                            navigation: ShoppingMegaMenuScreen()),
                        Divider(),
                        singleOption(
                            iconData: MdiIcons.faceAgent,
                            option: "Help \& Support",
                            navigation: ShoppingChatScreen()),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(MySize.size4)),
                            color: themeData.colorScheme.primary.withAlpha(220),
                            splashColor: Colors.white.withAlpha(100),
                            highlightColor:
                                themeData.colorScheme.primary.withAlpha(220),
                            onPressed: () {
                              Navigator.pop(widget.rootContext);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  MdiIcons.logoutVariant,
                                  color: themeData.colorScheme.onPrimary,
                                  size: MySize.size18,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: MySize.size16),
                                  child: Text(
                                    "LOGOUT",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        letterSpacing: 0.3,
                                        fontWeight: 600,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(
                                top: MySize.size8,
                                left: MySize.size24,
                                bottom: MySize.size8,
                                right: MySize.size24),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            ));
      },
    );
  }

  Widget singleOption({IconData iconData, String option, Widget navigation}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: MySize.size8, horizontal: 0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigation));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                iconData,
                size: MySize.size22,
                color: themeData.colorScheme.onBackground,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: MySize.size16),
                child: Text(option,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 600)),
              ),
            ),
            Container(
              child: Icon(MdiIcons.chevronRight,
                  size: MySize.size22,
                  color: themeData.colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
