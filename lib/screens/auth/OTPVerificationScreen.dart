/*
* File : OTP verification
* Version : 1.0.0
* */


import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController _numberController,
      _otp1Controller,
      _otp2Controller,
      _otp3Controller,
      _otp4Controller;
  FocusNode _otp1FocusNode, _otp2FocusNode, _otp3FocusNode, _otp4FocusNode;

  ThemeData themeData;
  bool isInVerification = false;

  List<bool> _dataExpansionPanel = [true, false];

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController(text: "+91 ");
    _otp1Controller = TextEditingController();
    _otp2Controller = TextEditingController();
    _otp3Controller = TextEditingController();
    _otp4Controller = TextEditingController();

    _otp1FocusNode = FocusNode();
    _otp2FocusNode = FocusNode();
    _otp3FocusNode = FocusNode();
    _otp4FocusNode = FocusNode();

    _otp1Controller.addListener(() {
      if (_otp1Controller.text.length >= 1) {
        _otp2FocusNode.requestFocus();
      }
    });

    _otp2Controller.addListener(() {
      if (_otp2Controller.text.length >= 1) {
        _otp3FocusNode.requestFocus();
      }
    });

    _otp3Controller.addListener(() {
      if (_otp3Controller.text.length >= 1) {
        _otp4FocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _numberController.dispose();
    _otp1Controller.dispose();
    _otp2Controller.dispose();
    _otp3Controller.dispose();
    _otp4Controller.dispose();
    _otp1FocusNode.dispose();
    _otp2FocusNode.dispose();
    _otp3FocusNode.dispose();
    _otp4FocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: Stack(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("OTP Verification",
                          style: themeData.appBarTheme.textTheme.headline6),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size32, left: MySize.size16, right: MySize.size16),
                        child: ExpansionPanelList(
                          expandedHeaderPadding: EdgeInsets.all(0),
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              _dataExpansionPanel[index] = !isExpanded;
                            });
                          },
                          animationDuration: Duration(milliseconds: 500),
                          children: <ExpansionPanel>[
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return Container(
                                      padding: EdgeInsets.all(MySize.size16),
                                      child: Text("Number",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle1,
                                              fontWeight: isExpanded
                                                  ? 600
                                                  : 400)));
                                },
                                body: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText1,
                                            letterSpacing: 0.1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 500),
                                        decoration: InputDecoration(
                                          prefixText: "+91 ",
                                          prefixStyle: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              letterSpacing: 0.1,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 500),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8.0),
                                              ),
                                              borderSide: BorderSide.none),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8.0),
                                              ),
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8.0),
                                              ),
                                              borderSide: BorderSide.none),
                                          filled: true,
                                          fillColor:
                                              themeData.colorScheme.background,
                                          prefixIcon: Icon(
                                            MdiIcons.phoneOutline,
                                            size: 22,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(200),
                                          ),
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(0),
                                        ),
                                        keyboardType: TextInputType.number,
                                        autofocus: true,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            OutlineButton(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal: 32),
                                                borderSide: BorderSide(
                                                    color: themeData
                                                        .colorScheme.secondary,
                                                    style: BorderStyle.solid,
                                                    width: 1),
                                                color: Colors.transparent,
                                                splashColor: Colors.white,
                                                onPressed: () {
                                                  onSendOTP();
                                                },
                                                child: Text("Call Me",
                                                    style: AppTheme.getTextStyle(
                                                        themeData.textTheme
                                                            .bodyText2,
                                                        fontWeight:
                                                            600,
                                                        color: themeData
                                                            .colorScheme
                                                            .onBackground))),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: themeData
                                                        .colorScheme.primary
                                                        .withAlpha(24),
                                                    blurRadius: 3,
                                                    offset: Offset(0,
                                                        1), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: FlatButton(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 32),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(4)),
                                                  color: themeData
                                                      .colorScheme.primary,
                                                  splashColor: Colors.white
                                                      .withAlpha(150),
                                                  highlightColor: themeData
                                                      .colorScheme.primary,
                                                  onPressed: () {
                                                    onSendOTP();
                                                  },
                                                  child: Text("Send OTP",
                                                      style:
                                                          AppTheme.getTextStyle(
                                                              themeData
                                                                  .textTheme
                                                                  .bodyText2,
                                                              fontWeight:600,
                                                              color: themeData
                                                                  .colorScheme
                                                                  .onPrimary))),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                isExpanded: _dataExpansionPanel[0]),
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return Container(
                                      padding: EdgeInsets.all(16),
                                      child: Text("OTP",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle1,
                                              fontWeight: isExpanded
                                                  ? 600
                                                  : 500)));
                                },
                                body: Container(
                                    padding:
                                        EdgeInsets.only(bottom: MySize.size16, top: MySize.size8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            singleDigitWidget(_otp1Controller,
                                                _otp1FocusNode),
                                            singleDigitWidget(_otp2Controller,
                                                _otp2FocusNode),
                                            singleDigitWidget(_otp3Controller,
                                                _otp3FocusNode),
                                            singleDigitWidget(_otp4Controller,
                                                _otp4FocusNode),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text("Resend in ",
                                                    style:
                                                        AppTheme.getTextStyle(
                                                            themeData.textTheme
                                                                .caption,
                                                            fontWeight:
                                                                600,
                                                            letterSpacing:
                                                                0.2)),
                                                Text("00:59",
                                                    style:
                                                        AppTheme.getTextStyle(
                                                            themeData.textTheme
                                                                .caption,
                                                            fontWeight:
                                                               500)),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(MySize.size8)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: themeData
                                                        .colorScheme.primary
                                                        .withAlpha(24),
                                                    blurRadius: 3,
                                                    offset: Offset(0, 1),
                                                  ),
                                                ],
                                              ),
                                              child: FlatButton(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: MySize.size8,
                                                      horizontal: MySize.size32),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              MySize.size4)),
                                                  color: themeData
                                                      .colorScheme.primary,
                                                  splashColor: Colors.white
                                                      .withAlpha(150),
                                                  highlightColor: themeData
                                                      .colorScheme.primary,
                                                  onPressed: () {},
                                                  child: Text("Verify",
                                                      style: AppTheme.getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText2,
                                                          fontWeight:600,
                                                          color: themeData.colorScheme.onPrimary))),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                isExpanded: _dataExpansionPanel[1])
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MySize.size30,
                  left: MySize.size10,
                  child: BackButton(
                    color: themeData.appBarTheme.iconTheme.color,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            )));
      },
    );
  }

  void onSendOTP() {
    if (!isInVerification) {
      FocusScope.of(context).unfocus();
      setState(() {
        isInVerification = false; // use here own logic
        _dataExpansionPanel[1] = true;
      });
    }
  }

  Widget singleDigitWidget(
      TextEditingController _controller, FocusNode _focusNode) {
    return Container(
      width: 36,
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: MySize.size4),
      color: Colors.transparent,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(
                    width: 2,
                    color: themeData
                        .inputDecorationTheme.border.borderSide.color)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    width: 2,
                    color: themeData
                        .inputDecorationTheme.enabledBorder.borderSide.color)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    width: 2,
                    color: themeData
                        .inputDecorationTheme.focusedBorder.borderSide.color)),
            helperText: ""),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}
