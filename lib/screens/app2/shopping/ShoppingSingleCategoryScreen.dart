import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class ShoppingSingleCategoryScreen extends StatefulWidget {
  @override
  _ShoppingSingleCategoryScreenState createState() =>
      _ShoppingSingleCategoryScreenState();
}

class _ShoppingSingleCategoryScreenState
    extends State<ShoppingSingleCategoryScreen> {
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
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: customAppTheme.bgLayer1,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Camera",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: customAppTheme.bgLayer1,
                body: Container(

                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: MySize.size24),
                        child: Text(
                          "Top category",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 700,
                              color: themeData.colorScheme.onBackground,
                              letterSpacing: 0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: MySize.size24),
                                child: singleType(
                                    title: 'Camera\nCompact',
                                    image:
                                        './assets/images/shopping/camera/camera-1.jpg'),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size16),
                                child: singleType(
                                    title: 'DSLR',
                                    image:
                                        './assets/images/shopping/camera/camera-2.jpg'),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: MySize.size16, right: MySize.size24),
                                child: singleType(
                                    title: 'Mirrorless',
                                    image:
                                        './assets/images/shopping/camera/camera-3.jpg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MySize.size24, left: MySize.size24),
                        child: Text(
                          "Sub category",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 700,
                              color: themeData.colorScheme.onBackground),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MySize.size16,
                            left: MySize.size24,
                            right: MySize.size24),
                        child: Wrap(
                          runSpacing: MySize.size12,
                          spacing: MySize.size12,
                          children: <Widget>[
                            singleSubCategory(subCategory: "Drone"),
                            singleSubCategory(subCategory: "Analog"),
                            singleSubCategory(subCategory: "Digital"),
                            singleSubCategory(subCategory: "Compact"),
                            singleSubCategory(subCategory: "Spy"),
                            singleSubCategory(subCategory: "CCTV"),
                            singleSubCategory(subCategory: "Accessories"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MySize.size24, left: MySize.size24),
                        child: Text(
                          "Related",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 700,
                              color: themeData.colorScheme.onBackground,
                              letterSpacing: 0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size16,
                            bottom: MySize.size24),
                        child: Column(
                          children: <Widget>[
                            singleProduct(
                                name: 'Film Camera',
                                image:
                                    './assets/images/shopping/camera/camera-3.jpg',
                                shopName: 'G Camera',
                                star: 4.5,
                                price: 299),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: singleProduct(
                                  name: 'Bridge Camera',
                                  image:
                                      './assets/images/shopping/camera/camera-2.jpg',
                                  shopName: 'Reliance',
                                  star: 4.5,
                                  price: 799),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: singleProduct(
                                  name: 'Instant Camera',
                                  image:
                                      './assets/images/shopping/camera/camera-1.jpg',
                                  shopName: 'Sony',
                                  star: 4.5,
                                  price: 999),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleType({String image, String title}) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
            child: Image(
              image: AssetImage(image),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.4,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: MySize.size16,
            left: MySize.size16,
            child: Center(
              child: Text(
                title,
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                    color: Colors.white, fontWeight: 700),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget singleSubCategory({String subCategory}) {
    return Container(
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
          boxShadow: [
            BoxShadow(
                color: customAppTheme.shadowColor.withAlpha(220),
                blurRadius: MySize.size4,
                offset: Offset(0, MySize.size2))
          ]),
      padding: EdgeInsets.only(
          left: MySize.size12,
          right: MySize.size12,
          top: MySize.size6,
          bottom: MySize.size6),
      child: Text(
        subCategory,
        style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
            color: themeData.colorScheme.onBackground,
            fontWeight: 500,
            letterSpacing: 0.2),
      ),
    );
  }

  Widget singleProduct(
      {String name, String image, String shopName, double star, int price}) {
    return Container(
      decoration: BoxDecoration(
        color: themeData.cardTheme.color,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),

        border: Border.all(color: customAppTheme.bgLayer4,width: 1)
      ),
      padding: EdgeInsets.all(MySize.size16),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
            child: Image.asset(
              image,
              height: MySize.getScaledSizeHeight(90),
              fit: BoxFit.fill,
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
                        color: themeData.colorScheme.onBackground.withAlpha(75),
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
    );
  }
}
