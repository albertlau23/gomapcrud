import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';
import 'ShoppingProductScreen.dart';

class ShoppingHomeScreen extends StatefulWidget {
  final BuildContext rootContext;

  const ShoppingHomeScreen({Key key, @required this.rootContext})
      : super(key: key);

  @override
  _ShoppingHomeScreenState createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen>
    with SingleTickerProviderStateMixin {
  CustomAppTheme customAppTheme;
  ThemeData themeData;

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
                  backgroundColor: themeData.backgroundColor,
                  body: ListView(
                    padding: EdgeInsets.all(0),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Welcome",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  color: themeData.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  fontWeight: 600),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(new MaterialPageRoute<Null>(
                                    builder: (BuildContext context) {
                                      return NotificationDialog();
                                    },
                                    fullscreenDialog: true));
                              },
                              child: Stack(
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.bellOutline,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(200),
                                  ),
                                  Positioned(
                                    right: -2,
                                    top: -2,
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      height: MySize.size14,
                                      width: MySize.size14,
                                      decoration: BoxDecoration(
                                          color: themeData.colorScheme.primary,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size40))),
                                      child: Center(
                                        child: Text(
                                          "2",
                                          style: AppTheme.getTextStyle(
                                            themeData.textTheme.overline,
                                            color:
                                            themeData.colorScheme.onPrimary,
                                            fontSize: 9,
                                            fontWeight: 500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(MySize.size16),
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: customAppTheme.bgLayer3),
                          color: customAppTheme.bgLayer1,
                          borderRadius: BorderRadius.all(
                              Radius.circular(MySize.size8)),
                          boxShadow: [
                            BoxShadow(
                              color:
                              customAppTheme.shadowColor.withAlpha(200),
                              blurRadius: MySize.size8,
                              offset: Offset(0, MySize.size2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: MySize.getScaledSizeHeight(120),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(MySize.size8),
                                      decoration: BoxDecoration(
                                          color: customAppTheme.bgLayer3,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size4))),
                                      child: Text(
                                        "Trending",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            muted: true,
                                            letterSpacing: 0.3,
                                            fontWeight: 600),
                                      ),
                                    ),
                                    Text(
                                      "Colorful Sandal",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600,
                                          letterSpacing: 0),
                                    ),
                                    Text(
                                      "\$ 49.99",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600,
                                          letterSpacing: 0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size4)),
                                child: Image(
                                  image: AssetImage(
                                      './assets/images/shopping/product/product-8.jpg'),
                                  width: MySize.getScaledSizeHeight(125),
                                  height: MySize.getScaledSizeHeight(125),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Popular Deals",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600,
                                    letterSpacing: 0)),
                            Text("View all",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontWeight: 500,
                                    color: themeData.colorScheme.primary,
                                    letterSpacing: 0)),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: MySize.size24),
                                child: singleItemWidget(
                                    image: './assets/images/shopping/product/product-10.jpg',
                                    name: "Pop corn",
                                    rate: 45.99),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size24),
                                child: singleItemWidget(
                                    image: './assets/images/shopping/product/product-7.jpg',
                                    name: "Cosmic bang",
                                    rate: 78.99),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size24),
                                child: singleItemWidget(
                                    image: './assets/images/shopping/product/product-5.jpg',
                                    name: "Sweet Gems",
                                    rate: 35.99),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size24),
                                child: singleItemWidget(
                                    image: './assets/images/shopping/product/product-2.jpg',
                                    name: "Toffees",
                                    rate: 28.49),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: MySize.size24, right: MySize.size24),
                                child: singleItemWidget(
                                    image: './assets/images/shopping/product/product-3.jpg',
                                    name: "Candies",
                                    rate: 15.99),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("For you",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600,
                                    letterSpacing: 0)),
                            Text("View all",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.primary,
                                    fontWeight: 500,
                                    letterSpacing: 0)),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: singleForYouWidget(
                                name: "Sweet Gems",
                                image: './assets/images/shopping/product/product-5.jpg',
                                shopName: 'El Primo',

                                star: 4.5,
                                price: 1470,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size24),
                              child: singleForYouWidget(
                                name: "Lipsticks",
                                image: './assets/images/shopping/product/product-4.jpg',
                                shopName: 'Bee Lipstore',
                                star: 3.8,
                                price: 1486,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size24),
                              child: singleForYouWidget(
                                name: "Candies",
                                image: './assets/images/shopping/product/product-3.jpg',
                                shopName: 'Bee Lipstore',
                                star: 4,
                                price: 1456,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        child: Text("Best sellers",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600,
                                letterSpacing: 0)),
                      ),
                      Container(
                        margin: EdgeInsets.all(MySize.size24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            singleSellerWidget(
                                image: './assets/images/avatar-1.jpg',
                                name: 'Liss\'s Shop'),
                            singleSellerWidget(
                                image: './assets/images/avatar-2.jpg',
                                name: 'Ekk Shop'),
                            singleSellerWidget(
                                image: './assets/images/avatar-3.jpg',
                                name: 'Shop Center'),
                            singleSellerWidget(
                                image: './assets/images/avatar-4.jpg',
                                name: 'Sweety')
                          ],
                        ),
                      ),
                    ],
                  )),
            ));
      },
    );
  }

  Widget singleItemWidget({String image, String name, double rate}) {
    String key = Generator.randomString(10);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ShoppingProductScreen(
                      heroTag: key,
                      image: image,
                    )));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size4)),
              child: Image.asset(
                image,
                height: MySize.getScaledSizeHeight(120),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8),
              child: Text(name,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.onBackground,
                      letterSpacing: 0,
                      muted: true,
                      fontWeight: 600)),
            ),
            Text("\$ " + rate.toString(),
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    color: themeData.colorScheme.onBackground,
                    letterSpacing: 0,
                    fontWeight: 500)),
          ],
        ),
      ),
    );
  }

  Widget singleSellerWidget({String image, String name}) {
    double size = MySize.safeWidth * 0.15;
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(size / 2)),
            child: Image(
              image: AssetImage(image),
              width: size,
              height: size,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size4),
            child: Text(
              name,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 500,
                  letterSpacing: 0),
            ),
          )
        ],
      ),
    );
  }

  Widget singleForYouWidget(
      {String name, String image, String shopName, double star, int price}) {
    String key = Generator.randomString(10);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ShoppingProductScreen(
                      heroTag: key,
                      image: image,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
          boxShadow: [
            BoxShadow(
              color: customAppTheme.shadowColor,
              blurRadius: MySize.size4,
              offset: Offset(0, MySize.size2),
            ),
          ],
        ),
        padding: EdgeInsets.all(MySize.size16),
        child: Row(
          children: <Widget>[
            Hero(
              tag: key,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
                child: Image.asset(
                  image,
                  height: MySize.getScaledSizeHeight(90),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MySize.getScaledSizeHeight(90),
                margin: EdgeInsets.only(left: MySize.size16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(name,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600,
                                letterSpacing: 0)),
                        Icon(
                          MdiIcons.heart,
                          color:
                          themeData.colorScheme.onBackground.withAlpha(75),
                          size: MySize.size22,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Generator.buildRatingStar(
                            rating: star,
                            size: MySize.size16,
                            inactiveColor: themeData.colorScheme.onBackground),
                        Container(
                          margin: EdgeInsets.only(left: MySize.size4),
                          child: Text(star.toString(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              MdiIcons.storeOutline,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(200),
                              size: MySize.size20,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MySize.size4),
                              child: Text(
                                shopName,
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(200),
                                    fontWeight: 500),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "\$ " + price.toString(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 700),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.backgroundColor,
        elevation: 0,
        title: Text("Notification",
            style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                fontWeight: 600)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: MySize.size16),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.notificationClearAll,
                size: MySize.size24,
                color: themeData.colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: themeData.backgroundColor,
        padding: EdgeInsets.all(MySize.size16),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Offers",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    width: MySize.size18,
                    height: MySize.size18,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size10))),
                    child: Center(
                        child: Text(
                          "2",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontSize: 10,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600),
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/images/shopping/product/product-8.jpg',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "50% OFF",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600,
                              letterSpacing: 0.2)),
                      TextSpan(
                          text: "in ultraboost all puma ltd shoes",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0.2))
                    ]),
                  ),
                  time: "9:35 AM"),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/images/shopping/product/product-2.jpg',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "30% OFF",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600,
                              letterSpacing: 0.2)),
                      TextSpan(
                          text: "in all cake till 31 july",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0.2))
                    ]),
                  ),
                  time: "9:35 AM"),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Orders",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    width: MySize.size18,
                    height: MySize.size18,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size10))),
                    child: Center(
                        child: Text(
                          "8",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontSize: 10,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600),
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/images/shopping/product/product-1.jpg',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text:
                          "Your cake order has been delivered at Himalaya",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0))
                    ]),
                  ),
                  time: "Just Now"),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/images/shopping/product/product-3.jpg',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "last order has_been cancelled by seller",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0.2))
                    ]),
                  ),
                  time: "14 July"),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: Center(
                child: Text(
                  "View all",
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: themeData.colorScheme.primary,
                      fontWeight: 600,
                      letterSpacing: 0.2),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Security",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    width: MySize.size18,
                    height: MySize.size18,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size10))),
                    child: Center(
                        child: Text(
                          "1",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontSize: 10,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600),
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/images/avatar-1.jpg',
                  text: RichText(
                    text: TextSpan(
                        text: "Your account password has been changed",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2)),
                  ),
                  time: "2 days ago"),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleNotification({String image, RichText text, String time}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MySize.size44,
            height: MySize.size44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
              DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(
                    left: MySize.size18, right: MySize.size18),
                child: text),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                time,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    color: themeData.colorScheme.onBackground,
                    fontSize: 12,
                    muted: true,
                    fontWeight: 500,
                    letterSpacing: -0.2),
              ),
            ],
          )
        ],
      ),
    );
  }


}
