import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';
import 'ShoppingCheckoutScreen.dart';
import 'ShoppingProductReviewScreen.dart';

class ShoppingProductScreen extends StatefulWidget {
  final String heroTag, image;

  const ShoppingProductScreen(
      {Key key,
      this.heroTag = "heroTag",
      this.image = './assets/product/product-5.jpg'})
      : super(key: key);

  @override
  _ShoppingProductScreenState createState() => _ShoppingProductScreenState();
}

class _ShoppingProductScreenState extends State<ShoppingProductScreen>
    with SingleTickerProviderStateMixin {
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  String descText = Generator.getDummyText(6);

  int selectedSize = 7;

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
                    title: Text("Febreze AIR",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 600)),
                  ),
                  backgroundColor: customAppTheme.bgLayer2,
                  body: Column(
                    children: <Widget>[
                      Expanded(
                          child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8)),
                                child: Image.asset(
                                  widget.image,
                                  width: MySize.safeHeight * 0.3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: Text(
                                "Febreze AIR",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 600,
                                    letterSpacing: 0.2),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size8),
                              child: Text(
                                descText,
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 400,
                                    letterSpacing: 0),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      child: Generator.buildProgress(
                                          width: MySize.size100,
                                          height: MySize.size5,
                                          activeColor:
                                              themeData.colorScheme.primary,
                                          inactiveColor: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(100),
                                          progress: 0.6)),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: MySize.size16),
                                    child: Text(
                                      "123 Items",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500,
                                          height: 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: MySize.size32, bottom: MySize.size16),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        _selectSizeSheet(context);
                                      },
                                      child: Container(
                                        width: MySize.safeWidth * 0.4,
                                        decoration: BoxDecoration(
                                            color: themeData.backgroundColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size8),
                                            ),
                                            border: Border.all(
                                                color: customAppTheme.bgLayer4,
                                                width: 0.8)),
                                        padding: EdgeInsets.only(
                                            top: MySize.size16,
                                            bottom: MySize.size16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.imageSizeSelectSmall,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              size: MySize.size24,
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: MySize.size8),
                                                child: Text(
                                                  "Change",
                                                  style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText1,
                                                    color: themeData.colorScheme
                                                        .onBackground,
                                                    fontWeight: 600,
                                                    letterSpacing: -0.2,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShoppingProductReviewScreen()));
                                      },
                                      child: Container(
                                        width: MySize.safeWidth * 0.4,
                                        margin: EdgeInsets.only(
                                            left: MySize.size16),
                                        decoration: BoxDecoration(
                                            color: themeData.backgroundColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size8),
                                            ),
                                            border: Border.all(
                                                color: customAppTheme.bgLayer4,
                                                width: 0.8)),
                                        padding: EdgeInsets.only(
                                            top: MySize.size16,
                                            bottom: MySize.size16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.commentTextOutline,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              size: MySize.size24,
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: MySize.size8),
                                                child: Text(
                                                  "Review",
                                                  style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText1,
                                                    color: themeData.colorScheme
                                                        .onBackground,
                                                    fontWeight: 600,
                                                    letterSpacing: -0.2,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: customAppTheme.bgLayer4, width: 1),
                            color: themeData.backgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(MySize.size24),
                                topRight: Radius.circular(MySize.size24))),
                        padding: EdgeInsets.symmetric(
                            vertical: MySize.size24, horizontal: MySize.size24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Color".toUpperCase(),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(180),
                                            fontWeight: 600),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: MySize.size8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              width: MySize.size20,
                                              height: MySize.size20,
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  shape: BoxShape.circle),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: MySize.size4),
                                              child: Icon(
                                                MdiIcons.chevronDown,
                                                size: MySize.size20,
                                                color: themeData
                                                    .colorScheme.onBackground
                                                    .withAlpha(200),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "QTY",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(180),
                                            fontWeight: 600),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: MySize.size8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              "2",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.headline6,
                                                  fontWeight: 600),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: MySize.size4),
                                              child: Icon(
                                                MdiIcons.chevronDown,
                                                size: MySize.size20,
                                                color: themeData
                                                    .colorScheme.onBackground
                                                    .withAlpha(200),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size24),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: themeData.colorScheme.primary
                                                .withAlpha(40),
                                            blurRadius: 4,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MySize.size8)),
                                        color: themeData.colorScheme.primary,
                                        splashColor: themeData.splashColor,
                                        highlightColor:
                                            themeData.colorScheme.primary,
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
                                                  "\$39.99",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.subtitle1,
                                                      letterSpacing: 0.4,
                                                      fontWeight: 700,
                                                      color: themeData
                                                          .colorScheme
                                                          .onPrimary),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: MySize.size16,
                                                  right: MySize.size16,
                                                  top: MySize.size8,
                                                  bottom: MySize.size8),
                                              decoration: BoxDecoration(
                                                  color: themeData.colorScheme
                                                      .primaryVariant,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              MySize.size8))),
                                              child: Text(
                                                "Buy",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.caption,
                                                    fontWeight: 600,
                                                    color: themeData
                                                        .colorScheme.onPrimary),
                                              ),
                                            )
                                          ],
                                        ),
                                        padding: EdgeInsets.only(
                                            top: MySize.size8,
                                            bottom: MySize.size8,
                                            right: MySize.size16),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: MySize.size16),
                                    padding: EdgeInsets.fromLTRB(
                                        MySize.size20,
                                        MySize.size12,
                                        MySize.size20,
                                        MySize.size12),
                                    decoration: BoxDecoration(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(40),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8))),
                                    child: Icon(
                                      MdiIcons.shoppingOutline,
                                      size: MySize.size24,
                                      color: themeData.colorScheme.primary,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ));
      },
    );
  }

  void _selectSizeSheet(context) {
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
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0))),
                padding: EdgeInsets.symmetric(
                    vertical: MySize.size32, horizontal: MySize.size24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Center(
                                child: Text(
                          "Select a Size",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 700),
                        ))),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              padding: EdgeInsets.all(MySize.size8),
                              decoration: BoxDecoration(
                                  color: themeData.colorScheme.background,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size16))),
                              child: Icon(
                                MdiIcons.close,
                                size: 16,
                                color: themeData.colorScheme.onBackground,
                              )),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 4;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 4,
                              isSelected: selectedSize == 4,
                            ),
                          ),
                          SingleSizeWidget(
                            size: 5,
                            isAvailable: false,
                            isSelected: selectedSize == 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 6;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 6,
                              isSelected: selectedSize == 6,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 7;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 7,
                              isSelected: selectedSize == 7,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 8;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 8,
                              isSelected: selectedSize == 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SingleSizeWidget(
                            size: 9,
                            isAvailable: false,
                            isSelected: selectedSize == 9,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 11;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 11,
                              isSelected: selectedSize == 11,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 12;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 12,
                              isSelected: selectedSize == 12,
                            ),
                          ),
                          SingleSizeWidget(
                            size: 13,
                            isAvailable: false,
                            isSelected: selectedSize == 13,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 14;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 14,
                              isSelected: selectedSize == 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 64),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 52,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: themeData.colorScheme.primary,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          MdiIcons.imageSizeSelectSmall,
                                          color:
                                              themeData.colorScheme.onPrimary,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: MySize.size8),
                                        child: Text(
                                          "Size Guide",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              fontWeight: 600,
                                              letterSpacing: 0),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 0.8,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 52,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: themeData.colorScheme.primary,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          MdiIcons.emoticonSadOutline,
                                          color:
                                              themeData.colorScheme.onPrimary,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Can't Find?",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              fontWeight: 600,
                                              letterSpacing: 0),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}

class SingleSizeWidget extends StatefulWidget {
  final int size;
  final bool isAvailable, isSelected;

  const SingleSizeWidget(
      {Key key,
      @required this.size,
      this.isAvailable = true,
      this.isSelected = false})
      : super(key: key);

  @override
  _SingleSizeWidgetState createState() => _SingleSizeWidgetState();
}

class _SingleSizeWidgetState extends State<SingleSizeWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Container(
      width: MySize.getScaledSizeHeight(52),
      height: MySize.getScaledSizeHeight(52),
      decoration: BoxDecoration(
        border: Border.all(
            color: (widget.isAvailable && widget.isSelected)
                ? themeData.colorScheme.primary
                : themeData.colorScheme.background,
            width: 1.6),
        shape: BoxShape.circle,
        color: widget.isAvailable
            ? (widget.isSelected
                ? themeData.colorScheme.primary
                : Colors.transparent)
            : themeData.colorScheme.background,
      ),
      child: Center(
        child: Text(
          widget.size.toString(),
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
              letterSpacing: -0.2,
              fontWeight: 600,
              color: (widget.isAvailable && widget.isSelected)
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
        ),
      ),
    );
  }
}
