
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';
import 'ProductSearchScreen.dart';
import 'ShoppingProductScreen.dart';

class ShoppingSearchScreen extends StatefulWidget {
  final BuildContext rootContext;

  const ShoppingSearchScreen({Key key, @required this.rootContext})
      : super(key: key);

  @override
  _ShoppingSearchScreenState createState() => _ShoppingSearchScreenState();
}

class _ShoppingSearchScreenState extends State<ShoppingSearchScreen>
    with SingleTickerProviderStateMixin {
  ThemeData themeData;

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size24) /
        ((width / 2 - MySize.size24) + 60);
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  resizeToAvoidBottomPadding: true,
                  backgroundColor: themeData.backgroundColor,
                  body: ListView(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(MySize.size16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(new MaterialPageRoute<Null>(
                                          builder: (BuildContext context) {
                                            return ProductsSearchScreen();
                                          },
                                          fullscreenDialog: true));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: MySize.size8),
                                  decoration: BoxDecoration(
                                    color: themeData.backgroundColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: themeData.cardTheme.shadowColor
                                            .withAlpha(32),
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                  ),
                                  padding: EdgeInsets.all(MySize.size12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.magnify,
                                        color: themeData.colorScheme.primary,
                                        size: MySize.size20,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: MySize.size8),
                                        child: Text(
                                          "Search",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 600,
                                              letterSpacing: 0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext buildContext) {
                                        return SortBottomSheet();
                                      });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: MySize.size4, right: MySize.size4),
                                  decoration: BoxDecoration(
                                    color: themeData.backgroundColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: themeData.cardTheme.shadowColor
                                            .withAlpha(32),
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                  ),
                                  padding: EdgeInsets.all(MySize.size12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.swapVertical,
                                        color: themeData.colorScheme.primary,
                                        size: MySize.size20,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: MySize.size8),
                                        child: Text(
                                          "Sort",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 600,
                                              letterSpacing: 0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext buildContext) {
                                        return FilterBottomSheet();
                                      });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: MySize.size8),
                                  decoration: BoxDecoration(
                                    color: themeData.backgroundColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: themeData.cardTheme.shadowColor
                                            .withAlpha(32),
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                  ),
                                  padding: EdgeInsets.all(MySize.size12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.tune,
                                        color: themeData.colorScheme.primary,
                                        size: MySize.size22,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: MySize.size8),
                                        child: Text(
                                          "Filter",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 600,
                                              letterSpacing: 0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: GridView.count(
                            padding: EdgeInsets.only(bottom: MySize.size16,left: MySize.size16,right: MySize.size16),
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            crossAxisCount: 2,
                            childAspectRatio: findAspectRatio(
                                MediaQuery.of(context).size.width),
                            mainAxisSpacing: MySize.size16,
                            crossAxisSpacing: MySize.size16,
                            children: <Widget>[
                              _ProductListWidget(
                                name: "Yellow cake",
                                image: './assets/images/shopping/product/product-1.jpg',
                                shopName: 'Agus Bakery',
                                star: 4,
                                price: 39.99,
                                rootContext: widget.rootContext,
                              ),
                              _ProductListWidget(
                                name: "Cosmic bang",
                                image: './assets/images/shopping/product/product-7.jpg',
                                shopName: 'Den cosmics',
                                star: 4.5,
                                price: 49.59,
                                rootContext: widget.rootContext,
                              ),
                              _ProductListWidget(
                                name: "Sweet Gems",
                                image: './assets/images/shopping/product/product-5.jpg',
                                shopName: 'El Primo',
                                star: 3,
                                price: 29.59,
                                rootContext: widget.rootContext,
                              ),
                              _ProductListWidget(
                                name: "Lipsticks",
                                image: './assets/images/shopping/product/product-3.jpg',
                                shopName: 'Bee Lipstore',
                                star: 4,
                                price: 19.99,
                                rootContext: widget.rootContext,
                              ),
                              _ProductListWidget(
                                name: "Colorful sandal",
                                image: './assets/images/shopping/product/product-8.jpg',
                                shopName: 'Lee Shop',
                                star: 3.8,
                                price: 24.49,
                                rootContext: widget.rootContext,
                              ),
                              _ProductListWidget(
                                name: "Toffees",
                                image: './assets/images/shopping/product/product-2.jpg',
                                shopName: 'Toffee Bakery',
                                star: 5,
                                price: 89.99,
                                rootContext: widget.rootContext,
                              ),
                            ]),
                      ),
                    ],
                  )),
            ));
      },
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  ThemeData themeData;

  bool colorBlack = false,
      colorRed = true,
      colorOrange = false,
      colorTeal = true,
      colorPurple = false;

  bool sizeXS = false,
      sizeS = true,
      sizeM = false,
      sizeL = true,
      sizeXL = false;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: themeData.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(MySize.size16),
              topRight: Radius.circular(MySize.size16))),
      padding: EdgeInsets.symmetric(
          vertical: MySize.size24, horizontal: MySize.size24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Center(
                      child: Text(
                "Filter",
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                    fontWeight: 700),
              ))),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    padding: EdgeInsets.all(MySize.size8),
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size22))),
                    child: Icon(
                      MdiIcons.check,
                      size: MySize.size20,
                      color: themeData.colorScheme.onPrimary,
                    )),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size8),
            child: Text(
              "Type",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 600,
                  letterSpacing: 0),
            ),
          ),
          Container(
            child: _TypeChipWidget(),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size8),
            child: Text(
              "Color",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 600,
                  letterSpacing: 0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size16),
            child: Row(
              children: <Widget>[
                InkWell(
                    onTap: () {
                      setState(() {
                        colorBlack = !colorBlack;
                      });
                    },
                    child:
                        colorWidget(color: Colors.black, checked: colorBlack)),
                Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          colorRed = !colorRed;
                        });
                      },
                      child: colorWidget(color: Colors.red, checked: colorRed),
                    )),
                Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          colorOrange = !colorOrange;
                        });
                      },
                      child: colorWidget(
                          color: Colors.orange, checked: colorOrange),
                    )),
                Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          colorTeal = !colorTeal;
                        });
                      },
                      child:
                          colorWidget(color: Colors.teal, checked: colorTeal),
                    )),
                Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          colorPurple = !colorPurple;
                        });
                      },
                      child: colorWidget(
                          color: Colors.purple, checked: colorPurple),
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size16),
            child: Text(
              "Size",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 600,
                  letterSpacing: 0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      sizeXS = !sizeXS;
                    });
                  },
                  child: SingleSizeWidget(size: "XS", isSelected: sizeXS),
                )),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sizeS = !sizeS;
                      });
                    },
                    child: SingleSizeWidget(size: "S", isSelected: sizeS),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sizeM = !sizeM;
                      });
                    },
                    child: SingleSizeWidget(size: "M", isSelected: sizeM),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sizeL = !sizeL;
                      });
                    },
                    child: SingleSizeWidget(size: "L", isSelected: sizeL),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sizeXL = !sizeXL;
                      });
                    },
                    child: SingleSizeWidget(size: "XL", isSelected: sizeXL),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget colorWidget({Color color, bool checked = true}) {
    return Container(
      width: MySize.size36,
      height: MySize.size36,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size18)),
      ),
      child: checked
          ? Center(
              child: Icon(
                MdiIcons.check,
                color: Colors.white,
                size: MySize.size20,
              ),
            )
          : Container(),
    );
  }
}

class SingleSizeWidget extends StatefulWidget {
  final String size;
  final bool isSelected;

  const SingleSizeWidget(
      {Key key, @required this.size, @required this.isSelected})
      : super(key: key);

  @override
  _SingleSizeWidgetState createState() => _SingleSizeWidgetState();
}

class _SingleSizeWidgetState extends State<SingleSizeWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      width: MySize.size44,
      height: MySize.size44,
      decoration: BoxDecoration(
          border: widget.isSelected
              ? Border.all(color: Colors.transparent, width: 0)
              : Border.all(color: themeData.colorScheme.background, width: 1.6),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
          color: widget.isSelected
              ? themeData.colorScheme.primary
              : Colors.transparent,
          boxShadow: widget.isSelected
              ? [
                  BoxShadow(
                      color: themeData.colorScheme.primary.withAlpha(28),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2))
                ]
              : []),
      child: Center(
        child: Text(
          widget.size.toString(),
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
              letterSpacing: -0.2,
              fontWeight: 700,
              color: widget.isSelected
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
        ),
      ),
    );
  }
}

class _TypeChipWidget extends StatefulWidget {
  final List<String> typeList = [
   "Man",
    "Woman",
    "Shoes",
    "Sale"
  ];

  @override
  _TypeChipWidgetState createState() => _TypeChipWidgetState();
}

class _TypeChipWidgetState extends State<_TypeChipWidget> {
  List<String> selectedChoices = ["Man"];

  ThemeData themeData;

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.typeList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.all(MySize.size8),
        child: ChoiceChip(
          backgroundColor: themeData.colorScheme.background,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          selectedColor: themeData.colorScheme.primary,
          label: Text(item,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: selectedChoices.contains(item)
                      ? themeData.colorScheme.onSecondary
                      : themeData.colorScheme.onBackground,
                  fontWeight: selectedChoices.contains(item) ? 700 : 600)),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class SortBottomSheet extends StatefulWidget {
  @override
  _SortBottomSheetState createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: themeData.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(MySize.size16),
                topRight: Radius.circular(MySize.size16))),
        child: Padding(
          padding: EdgeInsets.only(
              top: MySize.size16,
              left: MySize.size24,
              right: MySize.size24,
              bottom: MySize.size16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: MySize.size8),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          _radioValue = 0;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                _radioValue = 0;
                              });
                            },
                            groupValue: _radioValue,
                            value: 0,
                            visualDensity: VisualDensity.compact,
                            activeColor: themeData.colorScheme.primary,
                          ),
                          Text("Price - ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 600)),
                          Text("High to Low",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _radioValue = 1;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                _radioValue = 1;
                              });
                            },
                            groupValue: _radioValue,
                            value: 1,
                            visualDensity: VisualDensity.compact,
                            activeColor: themeData.colorScheme.primary,
                          ),
                          Text("Price - ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 600)),
                          Text("Low to High",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _radioValue = 2;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                _radioValue = 2;
                              });
                            },
                            groupValue: _radioValue,
                            value: 2,
                            visualDensity: VisualDensity.compact,
                            activeColor: themeData.colorScheme.primary,
                          ),
                          Text("Name - ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 600)),
                          Text("A to Z",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _radioValue = 3;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                _radioValue = 3;
                              });
                            },
                            groupValue: _radioValue,
                            value: 3,
                            visualDensity: VisualDensity.compact,
                            activeColor: themeData.colorScheme.primary,
                          ),
                          Text("Name - ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 600)),
                          Text("Z to A",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductListWidget extends StatefulWidget {
  final String name, image, shopName;
  final double star;
  final double price;
  final BuildContext rootContext;

  const _ProductListWidget(
      {Key key,
      @required this.name,
      @required this.image,
      @required this.shopName,
      @required this.star,
      @required this.price,
      @required this.rootContext})
      : super(key: key);

  @override
  __ProductListWidgetState createState() => __ProductListWidgetState();
}

class __ProductListWidgetState extends State<_ProductListWidget> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    String key = Generator.randomString(10);
    themeData = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            widget.rootContext,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: key,
                      image: widget.image,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeData.cardTheme.color,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
          boxShadow: [
            BoxShadow(
              color: themeData.cardTheme.shadowColor.withAlpha(12),
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: key,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MySize.size8),
                        topRight: Radius.circular(MySize.size8)),
                    child: Image.asset(
                      widget.image,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    right: MySize.size8,
                    top: MySize.size8,
                    child: Icon(
                      MdiIcons.heartOutline,
                      color: themeData.colorScheme.primary,
                      size: MySize.size20,
                    ))
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  top: MySize.size8, left: MySize.size8, right: MySize.size8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.name,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          fontWeight: 500,
                          letterSpacing: 0)),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "\$ " + widget.price.toString(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 700,
                              letterSpacing: 0),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: themeData.colorScheme.primary,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size4))),
                          padding: EdgeInsets.only(
                              left: MySize.size6,
                              right: MySize.size8,
                              top: MySize.size2,
                              bottom: MySize.getScaledSizeHeight(3.5)),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                MdiIcons.star,
                                color: themeData.colorScheme.onPrimary,
                                size: MySize.size12,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size4),
                                child: Text(widget.star.toString(),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        fontSize: 11,
                                        color: themeData.colorScheme.onPrimary,
                                        fontWeight: 600)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
