import 'dart:async';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class ProductsSearchScreen extends StatefulWidget {
  @override
  _ProductsSearchScreenState createState() => _ProductsSearchScreenState();
}

class _ProductsSearchScreenState extends State<ProductsSearchScreen> {
  bool _isInProgress = false;
  Timer _timer;
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  void _onSubmit(text) {
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const Duration oneSec = const Duration(milliseconds: 2500);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer.cancel(),
              setState(
                () {
                  _isInProgress = false;
                },
              )
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer.cancel();
  }

  @override
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
                  body: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: themeData.backgroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8)),
                            boxShadow: [
                              BoxShadow(
                                  color: customAppTheme.shadowColor,
                                  blurRadius: MySize.size8,
                                  offset: Offset(0, MySize.size2))
                            ]),
                        padding: EdgeInsets.only(
                            left: MySize.size12,
                            top: MySize.size8,
                            right: MySize.size12,
                            bottom: MySize.size8),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  MdiIcons.chevronLeft,
                                  size: MySize.size24,
                                  color: themeData.colorScheme.onBackground,
                                )),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                     EdgeInsets.only(left: MySize.size16, right: MySize.size8),
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Try to Search",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      isDense: true,
                                    ),
                                    autofocus: false,
                                    maxLines: 1,
                                    textInputAction: TextInputAction.search,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onSubmitted: _onSubmit,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                    child: _isInProgress
                        ? Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                themeData.colorScheme.primary,
                              )),
                            ),
                          )
                        : Container(
                            color: themeData.backgroundColor,
                            child: ListView(
                              padding: EdgeInsets.all(0),
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: MySize.size16, right: MySize.size16),
                                  child: Text(
                                    "Result",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 600),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: MySize.size16, right: MySize.size16, top: MySize.size16),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                        margin: EdgeInsets.only(right: MySize.size8),
                                        child: _SimpleCard(
                                          image:
                                              './assets/images/shopping/product/product-7.jpg',
                                          name: 'Product-1',
                                          description:
                                              'Lorem ipsum, or lipsum as it is sometimes',
                                          star: 4,
                                          countStar: 15,
                                        ),
                                      )),
                                      Expanded(
                                          child: Container(
                                        margin: EdgeInsets.only(left: MySize.size8),
                                        child: _SimpleCard(
                                          image:
                                              './assets/images/shopping/product/product-8.jpg',
                                          name: 'Product-1',
                                          description:
                                              'Lorem ipsum, or lipsum as it is sometimes',
                                          star: 5,
                                          countStar: 2,
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: MySize.size16, left: MySize.size16, right: MySize.size16),
                                  child: Text(
                                    "Recommended",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: MySize.size16, bottom: MySize.size8),
                                          child: _SimpleCard(
                                            image:
                                                './assets/images/shopping/product/product-3.jpg',
                                            name: 'Product-1',
                                            description:
                                                'Lorem ipsum, or lipsum as it is sometimes',
                                            star: 4,
                                            countStar: 15,
                                            width: MySize.getScaledSizeHeight(160),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: MySize.size16, bottom: MySize.size8),
                                          child: _SimpleCard(
                                            image:
                                                './assets/images/shopping/product/product-5.jpg',
                                            name: 'Product-1',
                                            description:
                                                'Lorem ipsum, or lipsum as it is sometimes',
                                            star: 5,
                                            countStar: 2,
                                            width: MySize.getScaledSizeHeight(160),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: MySize.size16, right: MySize.size16, bottom: MySize.size8),
                                          child: _SimpleCard(
                                            image:
                                                './assets/images/shopping/product/product-2.jpg',
                                            name: 'Product-1',
                                            description:
                                                'Lorem ipsum, or lipsum as it is sometimes',
                                            star: 5,
                                            countStar: 2,
                                            width: MySize.getScaledSizeHeight(160),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                  ),
                ],
              )),
            ));
      },
    );
  }
}

class _SimpleCard extends StatefulWidget {
  final String image, name, description;
  final int star, countStar;
  final double width;

  const _SimpleCard({
    Key key,
    this.image,
    this.name,
    this.description,
    this.star,
    this.countStar,
    this.width,
  }) : super(key: key);

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<_SimpleCard> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      width: widget.width == null
          ? MediaQuery.of(context).size.width
          : widget.width,
      decoration: BoxDecoration(
        color: themeData.cardTheme.color,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(widget.image),
            width: widget.width == null
                ? MediaQuery.of(context).size.width
                : widget.width,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.name,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            fontWeight: 500)),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text(
                        widget.description,
                        style: themeData.textTheme.caption.merge(TextStyle(
                          color: themeData.colorScheme.onBackground,
                          letterSpacing: 0.15,
                          height: 1.2,
                        )),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Row(
                        children: <Widget>[
                          Generator.buildRatingStar(
                              rating: widget.star.toDouble(),
                              inactiveColor: Generator.starColor),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: Text(
                              "(" + widget.countStar.toString() + ")",
                              style: themeData.textTheme.bodyText2.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground,
                                      letterSpacing: 0.2)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
