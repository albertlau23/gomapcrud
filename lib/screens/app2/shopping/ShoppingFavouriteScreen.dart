import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class ShoppingFavouriteScreen extends StatefulWidget {
  const ShoppingFavouriteScreen({Key key}) : super(key: key);

  @override
  _ShoppingFavouriteScreenState createState() =>
      _ShoppingFavouriteScreenState();
}

class _ShoppingFavouriteScreenState extends State<ShoppingFavouriteScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  AnimationController _hideFabAnimController;
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _hideFabAnimController = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
      value: 1, // initially visible
    );

    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          _hideFabAnimController.forward();
          break;
        case ScrollDirection.reverse:
          _hideFabAnimController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _hideFabAnimController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        themeData = AppTheme.getThemeFromThemeMode(value.themeMode());
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                resizeToAvoidBottomInset: false,
                resizeToAvoidBottomPadding: true,
                appBar: AppBar(
                  backgroundColor: customAppTheme.bgLayer1,
                  elevation: 0,
                  leading: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  title: Text(
                    "Orders",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ),
                backgroundColor: customAppTheme.bgLayer2,
                floatingActionButton: FadeTransition(
                  opacity: _hideFabAnimController,
                  child: ScaleTransition(
                    scale: _hideFabAnimController,
                    child: Theme(
                      data: themeData.copyWith(
                          highlightColor: themeData.colorScheme.primaryVariant),
                      child: FloatingActionButton.extended(
                        label: Text(
                          "Create List",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              color: themeData.colorScheme.onPrimary,
                              fontWeight: 600,
                              letterSpacing: 0.8),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.plus,
                          color: themeData.colorScheme.onPrimary,
                        ),
                        backgroundColor: themeData.colorScheme.primary,
                        splashColor: Colors.white.withAlpha(100),
                      ),
                    ),
                  ),
                ),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.bottom(16),
                    controller: _scrollController,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: themeData.backgroundColor,
                            border: Border.all(color: customAppTheme.bgLayer4,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size8))),
                        margin: EdgeInsets.only(
                            left: MySize.size16, right: MySize.size16),
                        padding: EdgeInsets.all(MySize.size16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                   "List 1",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline6,
                                      fontWeight: 700,
                                      letterSpacing: -0.2,
                                      muted: true),
                                ),
                                Text(
                                  "Remove",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontSize: 12,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 500,
                                      letterSpacing: 0),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size8),
                              child: Column(
                                children: [
                                  singleProduct(
                                      name: "Cup Cake",
                                      price: 35.79,
                                      image: './assets/images/shopping/product/product-1.jpg'),
                                  singleProduct(
                                      name: "Roll",
                                      price: 45.89,
                                      image: './assets/images/shopping/product/product-2.jpg'),
                                  singleProduct(
                                      name: "Biscuit",
                                      price: 14.29,
                                      image: './assets/images/shopping/product/product-3.jpg')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: themeData.backgroundColor,
                            border: Border.all(color: customAppTheme.bgLayer4,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size8))),
                        margin: EdgeInsets.only(
                            top: MySize.size16,
                            left: MySize.size16,
                            right: MySize.size16),
                        padding: EdgeInsets.all(MySize.size16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "List 2",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline6,
                                      fontWeight: 700,
                                      letterSpacing: -0.2,
                                      muted: true),
                                ),
                                Text(
                                  "Remove",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontSize: 12,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 500,
                                      letterSpacing: 0),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size8),
                              child: Column(
                                children: [
                                  singleProduct(
                                      name: "Unsought",
                                      price: 17.89,
                                      image: './assets/images/shopping/product/product-5.jpg'),
                                  singleProduct(
                                      name: "Roll",
                                      price: 25.89,
                                      image: './assets/images/shopping/product/product-8.jpg'),
                                  singleProduct(
                                      name: "Biscuit",
                                      price: 89.29,
                                      image: './assets/images/shopping/product/product-7.jpg'),
                                  singleProduct(
                                      name: "Toy Car",
                                      price: 89.29,
                                      image: './assets/images/shopping/product/product-9.jpg'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: themeData.backgroundColor,
                            border: Border.all(color: customAppTheme.bgLayer4,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size8))),
                        margin: EdgeInsets.only(
                            top: MySize.size16,
                            left: MySize.size16,
                            right: MySize.size16),
                        padding: EdgeInsets.all(MySize.size16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "List 3",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline6,
                                      fontWeight: 700,
                                      letterSpacing: -0.2,
                                      muted: true),
                                ),
                                Text(
                                  "Remove",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontSize: 12,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 500,
                                      letterSpacing: 0),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size8),
                              child: Column(
                                children: [
                                  singleProduct(
                                      name: "Unsought",
                                      price: 17.89,
                                      image: './assets/images/shopping/product/product-10.jpg'),
                                  singleProduct(
                                      name: "Roll",
                                      price: 25.89,
                                      image: './assets/images/shopping/product/product-11.jpg')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleProduct({String image, String name, double price}) {
    List<String> _textIconChoice = [
      "Remove",
      "Other"
    ];

    return Container(
      margin: EdgeInsets.only(top: MySize.size8, bottom: MySize.size8),
      child: Row(
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
              child: Image.asset(
                image,
                height: MySize.size52,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: MySize.size16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                        letterSpacing: -0.3, fontWeight: 600),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size4),
                    child: Text("\$$price",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            letterSpacing: -0.3,
                            muted: true,
                            fontWeight: 600)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: PopupMenuButton(
              padding: EdgeInsets.all(0),
              itemBuilder: (BuildContext context) {
                return _textIconChoice.map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: MySize.size16),
                          child: Text(choice,
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.button,
                                  fontWeight: 500)),
                        )
                      ],
                    ),
                  );
                }).toList();
              },
              icon: Icon(MdiIcons.dotsVertical,
                  color: themeData.colorScheme.onBackground.withAlpha(220)),
              color: themeData.backgroundColor,
            ),
          )
        ],
      ),
    );
  }
}
