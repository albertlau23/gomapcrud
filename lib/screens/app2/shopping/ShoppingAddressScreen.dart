import 'dart:collection';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class ShoppingAddressScreen extends StatefulWidget {
  @override
  _ShoppingAddressScreenState createState() => _ShoppingAddressScreenState();
}

class _ShoppingAddressScreenState extends State<ShoppingAddressScreen> {
  GoogleMapController mapController;
  ThemeData themeData;
  BitmapDescriptor pinLocationIcon;
  int _radioValue = 1;

  bool loaded = false;

  final Set<Marker> _markers = HashSet();
  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => {changeLoaded()});
  }

  changeLoaded() {
    setState(() {
      loaded = true;
    });
  }

  Marker marker = Marker(
    markerId: MarkerId('1'),
    position: LatLng(45.521563, -122.677433),
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.add(marker);
    });
    
  }

  void changeLocation(double zoom, LatLng latLng) {
    double newZoom = zoom > 15 ? zoom : 15;
    setState(() {
      mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: newZoom)));
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId('1'),
        position: latLng,
      ));
    });
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
                body: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: loaded
                        ? GoogleMap(
                            onMapCreated: _onMapCreated,
                            markers: _markers,
                            onTap: (latLong) {
                              mapController.getZoomLevel().then(
                                  (value) => {changeLocation(value, latLong)});
                            },
                            initialCameraPosition: CameraPosition(
                              target: _center,
                              zoom: 11.0,
                            ),
                          )
                        : Container(),
                  ),
                  Container(
                      padding: EdgeInsets.all(MySize.size16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _radioValue = 1;
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        visualDensity: VisualDensity.compact,
                                        activeColor:
                                            themeData.colorScheme.primary,
                                        groupValue: _radioValue,
                                        onChanged: (int value) {
                                          setState(() {
                                            _radioValue = value;
                                          });
                                        },
                                      ),
                                      Text("Office",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              fontWeight: 600)),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _radioValue = 2;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: MySize.size8),
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                          value: 2,
                                          visualDensity: VisualDensity.compact,
                                          activeColor:
                                              themeData.colorScheme.primary,
                                          groupValue: _radioValue,
                                          onChanged: (int value) {
                                            setState(() {
                                              _radioValue = value;
                                            });
                                          },
                                        ),
                                        Text("Home",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle2,
                                                fontWeight: 600)),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _radioValue = 3;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: MySize.size8),
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                          value: 3,
                                          visualDensity: VisualDensity.compact,
                                          activeColor:
                                              themeData.colorScheme.primary,
                                          groupValue: _radioValue,
                                          onChanged: (int value) {
                                            setState(() {
                                              _radioValue = value;
                                            });
                                          },
                                        ),
                                        Text("Other",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle2,
                                                fontWeight: 600)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(MySize.size8),
                            decoration: BoxDecoration(
                              color: themeData.cardTheme.color,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size16)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.cardTheme.shadowColor
                                      .withAlpha(24),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 500,
                                      letterSpacing: 0.2),
                                  decoration: InputDecoration(
                                    hintStyle: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 500,
                                        letterSpacing: 0,
                                        color:
                                            themeData.colorScheme.onBackground),
                                    hintText:
                                        "Address 1",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8),
                                        ),
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8),
                                        ),
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8),
                                        ),
                                        borderSide: BorderSide.none),
                                    prefixIcon: Icon(MdiIcons.mapMarkerOutline,
                                        size: MySize.size24),
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                                Divider(
                                  height: 0,
                                ),
                                TextFormField(
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 500,
                                      letterSpacing: 0.2),
                                  decoration: InputDecoration(
                                    hintStyle: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 500,
                                        letterSpacing: 0,
                                        color:
                                            themeData.colorScheme.onBackground),
                                    hintText:"Delivery Note",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8),
                                        ),
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8),
                                        ),
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8),
                                        ),
                                        borderSide: BorderSide.none),
                                    prefixIcon: Icon(
                                      MdiIcons.informationOutline,
                                      size: MySize.size24,
                                    ),
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    MdiIcons.chevronLeft,
                                    color: themeData.colorScheme.onBackground,
                                    size: MySize.size24,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size8)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: themeData
                                                  .colorScheme.primary
                                                  .withAlpha(28),
                                              blurRadius: 4,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: FlatButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        MySize.size4)),
                                            color:
                                                themeData.colorScheme.primary,
                                            splashColor:
                                                Colors.white.withAlpha(150),
                                            highlightColor:
                                                themeData.colorScheme.primary,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            padding: EdgeInsets.only(
                                                left: MySize.size24,
                                                right: MySize.size24),
                                            child: Text(
                                                "Save Address"
                                                    .toUpperCase(),
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText2,
                                                    fontWeight: 600,
                                                    letterSpacing: 0.5,
                                                    color: themeData.colorScheme
                                                        .onPrimary))),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            )));
      },
    );
  }
}
