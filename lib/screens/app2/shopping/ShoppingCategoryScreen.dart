import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/screens/app2/shopping/ShoppingSingleCategoryScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppThemeNotifier.dart';

class ShoppingCategoryScreen extends StatefulWidget {
  @override
  _ShoppingCategoryScreenState createState() => _ShoppingCategoryScreenState();
}

class _ShoppingCategoryScreenState extends State<ShoppingCategoryScreen> {
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
            home: Scaffold(
                body: Container(
              color: customAppTheme.bgLayer1,
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          margin: Spacing.left(16),
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(
                              MdiIcons.chevronLeft,
                              color: themeData.colorScheme.onBackground,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: Spacing.right(24),
                            child: Center(
                              child: Text(
                                "Category",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.headline5,
                                    fontWeight: 700,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size24,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: singleCategory(
                          image: './assets/images/shopping/technology.jpg',
                          title: "Technology",
                          description: '241 Item'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size16,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: singleCategory(
                          image: './assets/images/shopping/lifestyle.jpg',
                          title: "Life Style",
                          description: '325 Item'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size16,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: singleCategory(
                          image: './assets/images/shopping/fashion.jpg',
                          title: "Fashion",
                          description: '784 Item'),
                    ),
                    Container(
                      margin: EdgeInsets.all(MySize.size16),
                      child: singleCategory(
                          image: './assets/images/shopping/art.jpg',
                          title: "Art",
                          description: '124 Item'),
                    ),
                  ],
                ),
              ),
            )));
      },
    );
  }

  Widget singleCategory({String image, String title, String description}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShoppingSingleCategoryScreen()));
        },
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
          child: Stack(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage(image),
                  height: MySize.getScaledSizeHeight(160),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withAlpha(150),
                  padding: EdgeInsets.only(
                      left: MySize.size16,
                      right: MySize.size16,
                      top: MySize.size8,
                      bottom: MySize.size8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          child: Text(
                        description.toString(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: Colors.white,
                            fontWeight: 600,
                            letterSpacing: 0.2),
                      )),
                      Text(
                        title.toString(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle1,
                            color: Colors.white,
                            fontWeight: 600,
                            letterSpacing: 0.2),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
