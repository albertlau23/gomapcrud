import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class ShoppingMegaMenuScreen extends StatefulWidget {
  @override
  _ShoppingMegaMenuScreenState createState() => _ShoppingMegaMenuScreenState();
}

class _ShoppingMegaMenuScreenState extends State<ShoppingMegaMenuScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size24) / ((width / 2 - MySize.size24) - 22);
  }

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
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Mega menu",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: Container(
                  child: GridView.count(
                    padding: EdgeInsets.only(
                        left: MySize.size16,
                        right: MySize.size16,
                        bottom: MySize.size16),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio:
                        findAspectRatio(MediaQuery.of(context).size.width),
                    mainAxisSpacing: MySize.size16,
                    crossAxisSpacing: MySize.size16,
                    children: <Widget>[
                      singleItem(
                          image: './assets/images/shopping/vector/tshirt.png',
                          title: "Top wear",
                          listItem: [
                            "Formal shirts",
                            "Casual t-shirts",
                            "Suits \& Blazers"
                          ]),
                      singleItem(
                          image: './assets/images/shopping/vector/dress.png',
                          title: "Dress",
                          listItem: [
                            "Balloon Dress",
                            "Cocktail Dress",
                            "Denim Dress"
                          ]),
                      singleItem(
                          image: './assets/images/shopping/vector/shoes.png',
                          title: "Shoes",
                          listItem: [
                            "Sports Shoes",
                            "Casual Shoes",
                            "Formal Shoes"
                          ]),
                      singleItem(
                          image: './assets/images/shopping/vector/laptop.png',
                          title: "Laptop",
                          listItem: ["Ultrabook", "Chromebook", "Macbook"]),
                      singleItem(
                          image: './assets/images/shopping/vector/headphone.png',
                          title: "Headphone",
                          listItem: ["On Ear", "Over Ear", "Earbuds"]),
                      singleItem(
                          image: './assets/images/shopping/vector/mobile.png',
                          title: "Mobile",
                          listItem: [
                            "Xiaomi",
                            "Samsung",
                            "Apple",
                          ]),
                      singleItem(
                          image: './assets/images/shopping/vector/watch.png',
                          title: "Watches",
                          listItem: ["Titan", "Fast Track", "Fossil"]),
                    ],
                  ),
                )));
      },
    );
  }

  Widget buildListItem(List<String> listItem) {
    List<Widget> list = [];

    for (int i = 0; i < listItem.length; i++) {
      list.add(Container(
        margin: EdgeInsets.only(bottom: MySize.size2),
        child: Text(
          listItem[i],
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
              color: themeData.colorScheme.onBackground,
              fontWeight: 500,
              letterSpacing: 0.2),
        ),
      ));
    }

    list.add(Container(
      margin: EdgeInsets.only(bottom: MySize.size2),
      child: Text(
        "More ...",
        style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
            color: themeData.colorScheme.primary,
            fontWeight: 500,
            letterSpacing: 0.2),
      ),
    ));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  Widget singleItem({String image, String title, List<String> listItem}) {
    return Container(
      padding: EdgeInsets.all(MySize.size16),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
         border: Border.all(color: customAppTheme.bgLayer4,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size4))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage(image),
                height: MySize.size24,
                width: MySize.size24,
                color: themeData.colorScheme.primary,
              ),
              Container(
                margin: EdgeInsets.only(left: MySize.size8),
                child: Text(
                  title,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.primary,
                      fontWeight: 600,
                      letterSpacing: 0.2),
                ),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: MySize.size32, top: MySize.size8),
              child: buildListItem(listItem))
        ],
      ),
    );
  }
}
