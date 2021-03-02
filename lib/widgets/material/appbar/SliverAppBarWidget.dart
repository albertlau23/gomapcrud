/*
* File : Sliver Appbar widget
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../../AppThemeNotifier.dart';

class SliverAppBarWidget extends StatefulWidget {
  @override
  _SliverAppBarWidgetState createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  ThemeData themeData;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return SafeArea(
          child: Material(
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: MySliverAppBar(expandedHeight: 200),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (_, index) => Container(
                          color: themeData.backgroundColor,
                          child: ListTile(
                      title: Text("Index: $index",style: themeData.textTheme.subtitle2.merge(TextStyle(color: themeData.colorScheme.onBackground)),),
                    ),
                        ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showSnackbarWithFloating(String message) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData
              .textTheme
              .subtitle2
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image(image: AssetImage('./assets/images/all/all-l3.jpg'),fit: BoxFit.cover,),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "Sliver App Bar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width/2 - 100,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              child: SizedBox(
                height: expandedHeight,
                width: 200,
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
