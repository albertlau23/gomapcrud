/*
* File : Button Widget
* Version : 1.0.0
* */

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  ThemeData themeData;

  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              leading:IconButton(
                onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
              ),
              title: Text("Material Buttons",
                  style: AppTheme.getTextStyle(
                      themeData.textTheme.headline6,
                      fontWeight: 600)),
            ),
            body: Container(
                color: themeData.backgroundColor,
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: MySize.size16, right: MySize.size16, top: MySize.size8, bottom: MySize.size8),
                      child: Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(MySize.size8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Transparent",
                                      style: themeData.textTheme.subtitle2
                                          .merge(TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground))),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      OutlineButton(
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 0),
                                          splashColor: Color(0xff007bff),
                                          onPressed: () {},
                                          child: Text(
                                            "Primary",
                                            style: themeData.textTheme.bodyText2
                                                .merge(TextStyle(
                                                    color: themeData.colorScheme
                                                        .onBackground)),
                                          )),
                                      OutlineButton(
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 0),
                                          splashColor: Color(0xff495057),
                                          onPressed: () {},
                                          child: Text(
                                            "Secondary",
                                            style: themeData.textTheme.bodyText2
                                                .merge(TextStyle(
                                                    color: themeData.colorScheme
                                                        .onBackground)),
                                          )),
                                      OutlineButton(
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 0),
                                          splashColor: Color(0xff3cd278),
                                          onPressed: () {},
                                          child: Text(
                                            "Success",
                                            style: themeData.textTheme.bodyText2
                                                .merge(TextStyle(
                                                    color: themeData.colorScheme
                                                        .onBackground)),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      OutlineButton(
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 0),
                                          splashColor: Color(0xfff0323c),
                                          onPressed: () {},
                                          child: Text(
                                            "Danger",
                                            style: themeData.textTheme.bodyText2
                                                .merge(TextStyle(
                                                    color: themeData.colorScheme
                                                        .onBackground)),
                                          )),
                                      OutlineButton(
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 0),
                                          splashColor: Color(0xffffc837),
                                          onPressed: () {},
                                          child: Text(
                                            "Warning",
                                            style: themeData.textTheme.bodyText2
                                                .merge(TextStyle(
                                                    color: themeData.colorScheme
                                                        .onBackground)),
                                          )),
                                      OutlineButton(
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 0),
                                          splashColor: Color(0xff17a2b8),
                                          onPressed: () {},
                                          child: Text(
                                            "Info",
                                            style: themeData.textTheme.bodyText2
                                                .merge(TextStyle(
                                                    color: themeData.colorScheme
                                                        .onBackground)),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(MySize.size8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Outline",
                                      style: themeData.textTheme.subtitle2
                                          .merge(TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground))),
                                  Container(
                                    margin: EdgeInsets.only(top: MySize.size8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        OutlineButton(
                                            borderSide: BorderSide(
                                                color: Color(0xff0055ff),
                                                style: BorderStyle.solid,
                                                width: 1),
                                            splashColor: Color(0xff0055ff),
                                            onPressed: () {},
                                            child: Text(
                                              "Primary",
                                              style: themeData
                                                  .textTheme.bodyText2
                                                  .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground)),
                                            )),
                                        OutlineButton(
                                            borderSide: BorderSide(
                                                color: Color(0xff495057),
                                                style: BorderStyle.solid,
                                                width: 1),
                                            splashColor: Color(0xff495057),
                                            onPressed: () {},
                                            child: Text(
                                              "Secondary",
                                              style: themeData
                                                  .textTheme.bodyText2
                                                  .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground)),
                                            )),
                                        OutlineButton(
                                            borderSide: BorderSide(
                                                color: Color(0xff3cd278),
                                                style: BorderStyle.solid,
                                                width: 1),
                                            splashColor: Color(0xff3cd278),
                                            onPressed: () {},
                                            child: Text(
                                              "Success",
                                              style: themeData
                                                  .textTheme.bodyText2
                                                  .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground)),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: MySize.size8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        OutlineButton(
                                            borderSide: BorderSide(
                                                color: Color(0xfff0323c),
                                                style: BorderStyle.solid,
                                                width: 1),
                                            splashColor: Color(0xfff0323c),
                                            onPressed: () {},
                                            child: Text(
                                              "Danger",
                                              style: themeData
                                                  .textTheme.bodyText2
                                                  .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground)),
                                            )),
                                        OutlineButton(
                                            borderSide: BorderSide(
                                                color: Color(0xffffc837),
                                                style: BorderStyle.solid,
                                                width: 1),
                                            splashColor: Color(0xffffc837),
                                            onPressed: () {},
                                            child: Text(
                                              "Warning",
                                              style: themeData
                                                  .textTheme.bodyText2
                                                  .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground)),
                                            )),
                                        OutlineButton(
                                            borderSide: BorderSide(
                                                color: Color(0xff17a2b8),
                                                style: BorderStyle.solid,
                                                width: 1),
                                            splashColor: Color(0xff17a2b8),
                                            onPressed: () {},
                                            child: Text(
                                              "Info",
                                              style: themeData
                                                  .textTheme.bodyText2
                                                  .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground)),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(MySize.size8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Flat",
                                      style: themeData.textTheme.subtitle2
                                          .merge(TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground))),
                                  Container(
                                    margin: EdgeInsets.only(top: MySize.size8),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            FlatButton(
                                                color: Color(0xff0055ff),
                                                splashColor: Colors.white,
                                                onPressed: () {},
                                                child: Text(
                                                  "Primary",
                                                  style: themeData
                                                      .textTheme.bodyText2
                                                      .merge(TextStyle(
                                                          color: Colors.white)),
                                                )),
                                            FlatButton(
                                                color: Color(0xff495057),
                                                splashColor: Colors.white,
                                                onPressed: () {},
                                                child: Text(
                                                  "Secondary",
                                                  style: themeData
                                                      .textTheme.bodyText2
                                                      .merge(TextStyle(
                                                          color: Colors.white)),
                                                )),
                                            FlatButton(
                                                color: Color(0xff3cd278),
                                                splashColor: Colors.white,
                                                onPressed: () {},
                                                child: Text(
                                                  "Success",
                                                  style: themeData
                                                      .textTheme.bodyText2
                                                      .merge(TextStyle(
                                                          color: Colors.white)),
                                                )),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: MySize.size8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              FlatButton(
                                                  color: Color(0xfff0323c),
                                                  splashColor: Colors.white,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Danger",
                                                    style: themeData
                                                        .textTheme.bodyText2
                                                        .merge(TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  )),
                                              FlatButton(
                                                  color: Color(0xffffc837),
                                                  splashColor: Colors.white,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Warning",
                                                    style: themeData
                                                        .textTheme.bodyText2
                                                        .merge(TextStyle(
                                                            color:
                                                                Colors.black)),
                                                  )),
                                              FlatButton(
                                                  color: Color(0xff17a2b8),
                                                  splashColor: Colors.white,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Info",
                                                    style: themeData
                                                        .textTheme.bodyText2
                                                        .merge(TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Raised",
                                      style: themeData.textTheme.subtitle2
                                          .merge(TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground))),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            RaisedButton(
                                                color: Color(0xff0055ff),
                                                splashColor: Colors.white,
                                                onPressed: () {},
                                                hoverColor: Colors.blue,
                                                elevation: 8,
                                                child: Text(
                                                  "Primary",
                                                  style: themeData
                                                      .textTheme.bodyText2
                                                      .merge(TextStyle(
                                                          color: Colors.white)),
                                                )),
                                            RaisedButton(
                                                color: Color(0xff495057),
                                                splashColor: Colors.white,
                                                onPressed: () {},
                                                elevation: 8,
                                                child: Text(
                                                  "Secondary",
                                                  style: themeData
                                                      .textTheme.bodyText2
                                                      .merge(TextStyle(
                                                          color: Colors.white)),
                                                )),
                                            RaisedButton(

                                                color: Color(0xff3cd278),
                                                splashColor: Colors.white,
                                                onPressed: () {},
                                                elevation: 8,
                                                child: Text(
                                                  "Success",
                                                  style: themeData
                                                      .textTheme.bodyText2
                                                      .merge(TextStyle(
                                                          color: Colors.white)),
                                                )),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              RaisedButton(
                                                  color: Color(0xfff0323c),
                                                  splashColor: Colors.white,
                                                  onPressed: () {},
                                                  hoverColor: Colors.blue,
                                                  elevation: 8,
                                                  child: Text(
                                                    "Danger",
                                                    style: themeData
                                                        .textTheme.bodyText2
                                                        .merge(TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  )),
                                              RaisedButton(
                                                  color: Color(0xffffc837),
                                                  splashColor: Colors.white,
                                                  onPressed: () {},
                                                  elevation: 8,
                                                  child: Text(
                                                    "Warning",
                                                    style: themeData
                                                        .textTheme.bodyText2
                                                        .merge(TextStyle(
                                                            color:
                                                                Colors.black)),
                                                  )),
                                              RaisedButton(
                                                  color: Color(0xff17a2b8),
                                                  splashColor: Colors.white,
                                                  onPressed: () {},
                                                  elevation: 8,
                                                  child: Text(
                                                    "Info",
                                                    style: themeData
                                                        .textTheme.bodyText2
                                                        .merge(TextStyle(
                                                            color: themeData
                                                                .colorScheme
                                                                .onSecondary)),
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Rounded",
                                      style: themeData.textTheme.subtitle2
                                          .merge(TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground))),
                                  Container(
                                    margin: EdgeInsets.only(top: 16),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xff0055ff)
                                                        .withAlpha(40),
                                                    blurRadius: 5,
                                                    offset: Offset(0,
                                                        4), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            MySize.size8)),
                                                color: Color(0xff0055ff),
                                                splashColor:Colors.white,
                                                highlightColor:
                                                    themeData.primaryColor,
                                                onPressed: () {},
                                                child: Text(
                                                  "Primary",
                                                  style: AppTheme.getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText2,
                                                          fontWeight:600)
                                                      .merge(TextStyle(
                                                          color: themeData
                                                              .colorScheme
                                                              .onPrimary)),
                                                ),
                                                padding: EdgeInsets.only(
                                                    top: 12, bottom: 12),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xff495057)
                                                        .withAlpha(40),
                                                    blurRadius: 5,
                                                    offset: Offset(0,
                                                        4), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                color: Color(0xff495057),
                                                splashColor: Colors.white,
                                                highlightColor:
                                                    themeData.primaryColor,
                                                onPressed: () {},
                                                child: Text(
                                                  "Secondary",
                                                  style: AppTheme.getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText2,
                                                          fontWeight:600)
                                                      .merge(TextStyle(
                                                          color: themeData
                                                              .colorScheme
                                                              .onPrimary)),
                                                ),
                                                padding: EdgeInsets.only(
                                                    top: 12, bottom: 12),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xff3cd278)
                                                        .withAlpha(40),
                                                    blurRadius: 5,
                                                    offset: Offset(0,
                                                        4), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                color: Color(0xff3cd278),
                                                splashColor: Colors.white,
                                                highlightColor:
                                                    themeData.primaryColor,
                                                onPressed: () {},
                                                child: Text(
                                                  "Success",
                                                  style: AppTheme.getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText2,
                                                          fontWeight:600)
                                                      .merge(TextStyle(
                                                          color: themeData
                                                              .colorScheme
                                                              .onPrimary)),
                                                ),
                                                padding: EdgeInsets.only(
                                                    top: MySize.size12, bottom: MySize.size12),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: MySize.size8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(MySize.size8)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xfff0323c)
                                                          .withAlpha(40),
                                                      blurRadius: 5,
                                                      offset: Offset(0,
                                                          4), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: FlatButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  color: Color(0xfff0323c),
                                                  splashColor:
                                                     Colors.white,
                                                  highlightColor:
                                                      themeData.primaryColor,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Danger",
                                                    style: AppTheme
                                                            .getTextStyle(
                                                                themeData
                                                                    .textTheme
                                                                    .bodyText2,
                                                                fontWeight: 600)
                                                        .merge(TextStyle(
                                                            color: themeData
                                                                .colorScheme
                                                                .onPrimary)),
                                                  ),
                                                  padding: EdgeInsets.only(
                                                      top: MySize.size12, bottom: MySize.size12),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(MySize.size8)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xffffc837)
                                                          .withAlpha(40),
                                                      blurRadius: 5,
                                                      offset: Offset(0,
                                                          4), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: FlatButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              MySize.size8)),
                                                  color: Color(0xffffc837),
                                                  splashColor:
                                                      Colors.white,
                                                  highlightColor:
                                                      themeData.primaryColor,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Warning",
                                                    style:
                                                        AppTheme.getTextStyle(
                                                                themeData
                                                                    .textTheme
                                                                    .bodyText2,
                                                                fontWeight: 600)
                                                            .merge(TextStyle(
                                                                color: Colors
                                                                    .black)),
                                                  ),
                                                  padding: EdgeInsets.only(
                                                      top: MySize.size12, bottom: MySize.size12),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(MySize.size8)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xff17a2b8)
                                                          .withAlpha(40),
                                                      blurRadius: 5,
                                                      offset: Offset(0,
                                                          4), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: FlatButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  color: Color(0xff17a2b8),
                                                  splashColor:
                                                     Colors.white,
                                                  highlightColor:
                                                      themeData.primaryColor,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Info",
                                                    style:
                                                        AppTheme.getTextStyle(
                                                                themeData
                                                                    .textTheme
                                                                    .bodyText2,
                                                                fontWeight:600)
                                                            .merge(TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                  ),
                                                  padding: EdgeInsets.only(
                                                      top: MySize.size12, bottom: MySize.size12),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(MySize.size8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Other Buttons",
                                      style: themeData.textTheme.subtitle2
                                          .merge(TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground))),
                                  Container(
                                    margin: EdgeInsets.only(top: MySize.size8),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            FlatButton(
                                                shape: BeveledRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                color: Color(0xff0055ff),
                                                splashColor: Colors.white,
                                                onPressed: () {},
                                                child: Text(
                                                  "Primary",
                                                  style: themeData
                                                      .textTheme.bodyText2
                                                      .merge(TextStyle(
                                                          color: Colors.white)),
                                                )),
                                            FlatButton(
                                                shape: BeveledRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                color: Color(0xff495057),
                                                splashColor: Colors.white,
                                                onPressed: () {},
                                                child: Text(
                                                  "Secondary",
                                                  style: themeData
                                                      .textTheme.bodyText2
                                                      .merge(TextStyle(
                                                          color: Colors.white)),
                                                )),
                                            FlatButton(
                                                shape: BeveledRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            MySize.size8)),
                                                color: Color(0xff3cd278),
                                                splashColor: Colors.white,
                                                onPressed: () {},
                                                child: Text(
                                                  "Success",
                                                  style: themeData
                                                      .textTheme.bodyText2
                                                      .merge(TextStyle(
                                                          color: Colors.white)),
                                                )),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: MySize.size8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              FlatButton(
                                                  shape:
                                                      ContinuousRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  MySize.size12)),
                                                  color: Color(0xfff0323c),
                                                  splashColor: Colors.white,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Danger",
                                                    style: themeData
                                                        .textTheme.bodyText2
                                                        .merge(TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  )),
                                              FlatButton(
                                                  shape:
                                                      ContinuousRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  MySize.size24)),
                                                  color: Color(0xffffc837),
                                                  splashColor: Colors.white,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Warning",
                                                    style: themeData
                                                        .textTheme.bodyText2
                                                        .merge(TextStyle(
                                                            color:
                                                                Colors.black)),
                                                  )),
                                              FlatButton(
                                                  shape:
                                                      ContinuousRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  MySize.size36)),
                                                  color: Color(0xff17a2b8),
                                                  splashColor: Colors.white,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Info",
                                                    style: themeData
                                                        .textTheme.bodyText2
                                                        .merge(TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]))),
                )),
          ),
        );
      },
    );
  }
}
