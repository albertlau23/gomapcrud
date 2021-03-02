import 'dart:async';
import 'dart:math';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../AppTheme.dart';

class CustomChatTheme {
  Color backgroundColor,
      textFieldBackground,
      textOnTextField,
      hintTextOnTextField,
      iconOnTextField,
      btnColor,
      iconOnBtn,
      myChatBG,
      chatBG,
      onMyChat,
      onChat,
      appBarColor,
      onAppBar,
      onBackground,
      tickColor;

  static CustomChatTheme getWhatsAppTheme() {
    CustomChatTheme customChatTheme = CustomChatTheme();
    customChatTheme.backgroundColor = const Color(0xff343940);
    customChatTheme.textFieldBackground = const Color(0xff37404a);
    customChatTheme.textOnTextField = const Color(0xffebebeb);
    customChatTheme.hintTextOnTextField = const Color(0xffc2c2c2);
    customChatTheme.iconOnTextField = const Color(0xffb3b3b3);
    customChatTheme.btnColor = const Color(0xff01877c);
    customChatTheme.iconOnBtn = const Color(0xffebebeb);
    customChatTheme.myChatBG = const Color(0xff054640);
    customChatTheme.chatBG = const Color(0xff212e36);
    customChatTheme.onMyChat = const Color(0xfff5f5f5);
    customChatTheme.onChat = const Color(0xfff5f5f5);
    customChatTheme.appBarColor = const Color(0xff2e343b);
    customChatTheme.onAppBar = Colors.white;
    customChatTheme.onBackground = const Color(0xfff5f5f5);
    customChatTheme.tickColor = const Color(0xff33a3ca);

    return customChatTheme;
  }
}

class ChatModel {
  String message, from, timestamp, seenType;

  static final String myId = "myId";
  static final String otherId = "otherId";

  ChatModel(this.message, this.from, this.timestamp, this.seenType);
}

class ShoppingChatScreen extends StatefulWidget {
  @override
  _ShoppingChatScreenState createState() => _ShoppingChatScreenState();
}

class _ShoppingChatScreenState extends State<ShoppingChatScreen> {
  TextEditingController _chatTextController;
  ThemeData themeData;
  CustomChatTheme customChatTheme = CustomChatTheme.getWhatsAppTheme();

  List<ChatModel> _chatList = [];

  ScrollController _scrollController;

  List<Timer> _timers = [];

  @override
  initState() {
    super.initState();
    _chatTextController = TextEditingController();
    _scrollController = ScrollController();

    _chatList.add(ChatModel("How can i help you", ChatModel.otherId,
        DateTime.now().millisecondsSinceEpoch.toString(), "sent"));
  }

  dispose() {
    super.dispose();
    _scrollController.dispose();
    for (Timer timer in _timers) {
      timer.cancel();
    }
  }

  Widget build(BuildContext context) {
    themeData = AppTheme.darkTheme;
    return SafeArea(
      bottom: true,
      top: false,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: customChatTheme.appBarColor,
              automaticallyImplyLeading: false,
              title: Row(
                children: <Widget>[
                  Container(
                      child: ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white,
                        child: SizedBox(
                            width: MySize.size30,
                            height: MySize.size30,
                            child: Icon(
                              MdiIcons.arrowLeft,
                              color: customChatTheme.onAppBar,
                              size: MySize.size24,
                            )),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    child: Icon(
                      MdiIcons.robot,
                      color: customChatTheme.onAppBar,
                      size: MySize.size26,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: MySize.size16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Bot",
                              style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 500,
                                color: customChatTheme.onAppBar,
                              )),
                          Text("Private chat bot",
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  color: customChatTheme.onAppBar,
                                  fontWeight: 400)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              color: themeData.colorScheme.background,
              padding: EdgeInsets.only(
                  left: MySize.size8,
                  right: MySize.size8,
                  bottom: MySize.size8),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MySize.size4, horizontal: MySize.size12),
                    margin: EdgeInsets.only(
                        top: MySize.size8, bottom: MySize.size8),
                    decoration: BoxDecoration(
                        color: customChatTheme.chatBG,
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size4))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          MdiIcons.lock,
                          color: customChatTheme.onChat.withAlpha(200),
                          size: MySize.size12,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: MySize.size4),
                          child: Text(
                            "All chat is private",
                            style: themeData.textTheme.caption.merge(TextStyle(
                                color: customChatTheme.onChat.withAlpha(200),
                                letterSpacing: 0.3)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.all(0),
                        itemCount: _chatList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: index == 0
                                ? EdgeInsets.only(top: MySize.size8, bottom: MySize.size3).add(
                                    _chatList[index].from.compareTo(ChatModel.myId) == 0
                                        ? EdgeInsets.only(
                                            left: MediaQuery.of(context).size.width *
                                                0.2)
                                        : EdgeInsets.only(
                                            right: MediaQuery.of(context).size.width *
                                                0.2))
                                : EdgeInsets.only(top: MySize.size3, bottom: MySize.size3).add(
                                    _chatList[index].from.compareTo(ChatModel.myId) == 0
                                        ? EdgeInsets.only(
                                            left: MediaQuery.of(context).size.width * 0.2)
                                        : EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2)),
                            alignment: _chatList[index]
                                        .from
                                        .compareTo(ChatModel.myId) ==
                                    0
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: singleChat(index),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: MySize.size4),
                    child: suggestions(),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: MySize.size8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(MySize.size2),
                            decoration: BoxDecoration(
                                color: customChatTheme.textFieldBackground,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size24))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                    child: ClipOval(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.white,
                                      child: SizedBox(
                                          width: MySize.size44,
                                          height: MySize.size44,
                                          child: Icon(
                                            MdiIcons.emoticonOutline,
                                            size: MySize.size24,
                                            color:
                                                customChatTheme.iconOnTextField,
                                          )),
                                      onTap: () {},
                                    ),
                                  ),
                                )),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(bottom: MySize.size4),
                                    child: TextField(
                                      maxLines: 6,
                                      minLines: 1,
                                      style: themeData.textTheme.bodyText1
                                          .merge(TextStyle(
                                              color: customChatTheme
                                                  .textOnTextField)),
                                      decoration: InputDecoration(
                                        hintText: "Type a message...",
                                        isDense: true,
                                        hintStyle: themeData.textTheme.subtitle1
                                            .merge(TextStyle(
                                                color: customChatTheme
                                                    .textOnTextField
                                                    .withAlpha(220))),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      controller: _chatTextController,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    ),
                                  ),
                                ),
                                Container(
                                    child: ClipOval(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.white,
                                      child: SizedBox(
                                          width: MySize.size44,
                                          height: MySize.size44,
                                          child: Transform.rotate(
                                            angle: -pi / 4,
                                            child: Icon(
                                              MdiIcons.paperclip,
                                              size: MySize.size24,
                                              color: customChatTheme
                                                  .iconOnTextField,
                                            ),
                                          )),
                                      onTap: () {
                                        addBottomSheet(context);
                                      },
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: MySize.size8),
                            child: ClipOval(
                              child: Material(
                                color: customChatTheme.btnColor,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  child: SizedBox(
                                      width: MySize.size42,
                                      height: MySize.size42,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: MySize.size4),
                                        child: Icon(
                                          MdiIcons.send,
                                          size: MySize.size22,
                                          color: customChatTheme.iconOnBtn,
                                        ),
                                      )),
                                  onTap: () {
                                    sendMessage(_chatTextController.text);
                                  },
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget singleChat(int index) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: MySize.size4, horizontal: MySize.size8),
        decoration: BoxDecoration(
          color: _chatList[index].from.compareTo(ChatModel.myId) == 0
              ? customChatTheme.myChatBG
              : customChatTheme.chatBG,
          borderRadius: makeChatBubble(index),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MySize.size2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: MySize.size2),
                  child: Text(
                    _chatList[index].message,
                    style: themeData.textTheme.subtitle1.merge(TextStyle(
                        color:
                            _chatList[index].from.compareTo(ChatModel.myId) == 0
                                ? customChatTheme.onMyChat
                                : customChatTheme.onChat)),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: MySize.size8),
                child: Text(
                    getStringTimeFromMilliseconds(_chatList[index].timestamp),
                    style: themeData.textTheme.overline.merge(TextStyle(
                        letterSpacing: -0.1,
                        color:
                            _chatList[index].from.compareTo(ChatModel.myId) == 0
                                ? customChatTheme.onMyChat
                                : customChatTheme.onChat))),
              ),
              _chatList[index].from.compareTo(ChatModel.myId) != 0
                  ? Container()
                  : Container(
                      margin: EdgeInsets.only(left: MySize.size2),
                      child: Icon(
                          _chatList[index].seenType.compareTo("seen") == 0
                              ? MdiIcons.checkAll
                              : MdiIcons.check,
                          size: 14,
                          color: _chatList[index]
                                      .from
                                      .compareTo(ChatModel.myId) ==
                                  0
                              ? (_chatList[index].seenType.compareTo("seen") ==
                                      0
                                  ? customChatTheme.tickColor
                                  : customChatTheme.onMyChat)
                              : customChatTheme.onChat))
            ],
          ),
        ));
  }

  String getStringTimeFromMilliseconds(String timestamp) {
    try {
      int time = int.parse(timestamp);
      var date = DateTime.fromMillisecondsSinceEpoch(time);
      int hour = date.hour, min = date.minute;
      if (hour > 12) {
        if (min < 10) {
          return (hour - 12).toString() + ":0" + min.toString() + " pm";
        } else {
          return (hour - 12).toString() + ":" + min.toString() + " pm";
        }
      } else {
        if (min < 10) {
          return (hour).toString() + ":0" + min.toString() + " am";
        } else {
          return (hour).toString() + ":" + min.toString() + " am";
        }
      }
    } catch (e) {
      return "";
    }
  }

  BorderRadius makeChatBubble(int index) {
    if (_chatList[index].from.compareTo(ChatModel.myId) == 0) {
      if (index != 0) {
        if (_chatList[index - 1].from.compareTo(ChatModel.myId) == 0) {
          return BorderRadius.all(Radius.circular(MySize.size8));
        } else {
          return BorderRadius.only(
              topLeft: Radius.circular(MySize.size8),
              bottomRight: Radius.circular(MySize.size8),
              bottomLeft: Radius.circular(MySize.size8),
              topRight: Radius.circular(0));
        }
      } else {
        return BorderRadius.only(
            topLeft: Radius.circular(MySize.size8),
            bottomRight: Radius.circular(MySize.size8),
            bottomLeft: Radius.circular(MySize.size8),
            topRight: Radius.circular(0));
      }
    } else {
      if (index != 0) {
        if (_chatList[index - 1].from.compareTo(ChatModel.myId) != 0) {
          return BorderRadius.all(Radius.circular(MySize.size8));
        } else {
          return BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomRight: Radius.circular(MySize.size8),
              bottomLeft: Radius.circular(MySize.size8),
              topRight: Radius.circular(MySize.size8));
        }
      } else {
        return BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(MySize.size8),
            bottomLeft: Radius.circular(MySize.size8),
            topRight: Radius.circular(MySize.size8));
      }
    }
  }

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _chatTextController.clear();
        _chatList.add(ChatModel(message, ChatModel.myId,
            DateTime.now().millisecondsSinceEpoch.toString(), "sent"));
        startTimer(_chatList.length - 1, message);
      });
      scrollToBottom(isDelayed: true);
    }
  }

  void startTimer(int index, String message) {
    print(index);
    const oneSec = Duration(seconds: 1);
    const twoSec = Duration(seconds: 2);
    Timer timerSeen = Timer.periodic(
        oneSec,
        (Timer timer) => {
              timer.cancel(),
              setState(() {
                _chatList[index].seenType = "seen";
              })
            });
    _timers.add(timerSeen);
    Timer timer = Timer.periodic(
        twoSec, (Timer timer) => {timer.cancel(), sentFromOther(message)});
    _timers.add(timer);
  }

  void sentFromOther(String message) {
    setState(() {
      _chatList.add(ChatModel(message, ChatModel.otherId,
          DateTime.now().millisecondsSinceEpoch.toString(), "sent"));
      scrollToBottom(isDelayed: true);
    });
  }

  scrollToBottom({bool isDelayed = false}) {
    final int delay = isDelayed ? 400 : 0;
    Future.delayed(Duration(milliseconds: delay), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  void addBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            margin: EdgeInsets.only(
                bottom: MySize.size64,
                left: MySize.size16,
                right: MySize.size16),
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: themeData.backgroundColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size16))),
              child: Padding(
                padding: EdgeInsets.all(MySize.size16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    quickActionWidget(
                                      MdiIcons.textBoxOutline,
                                      "Document",
                                    ),
                                    quickActionWidget(
                                      MdiIcons.musicNoteOutline,
                                      "Audio",
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    quickActionWidget(
                                      MdiIcons.cameraOutline,
                                      "Camera",
                                    ),
                                    quickActionWidget(
                                      MdiIcons.mapMarkerOutline,
                                      "Location",
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    quickActionWidget(
                                      MdiIcons.imageOutline,
                                      "Gallery",
                                    ),
                                    quickActionWidget(
                                      MdiIcons.accountBoxOutline,
                                      "Contact",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget quickActionWidget(IconData iconData, String actionText) {
    return Container(
      margin: EdgeInsets.only(top: MySize.size8, bottom: MySize.size8),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: customChatTheme.btnColor, // button color
              child: InkWell(
                splashColor: Colors.white,
                // inkwell color
                child: SizedBox(
                    width: MySize.size52,
                    height: MySize.size52,
                    child: Icon(
                      iconData,
                      color: customChatTheme.iconOnBtn,
                      size: MySize.size24,
                    )),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size4),
            child: Text(
              actionText,
              style: themeData.textTheme.caption.merge(TextStyle(
                  color: themeData.colorScheme.onBackground,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }

  Widget suggestions() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                sendMessage("Go to favourites");
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size16)),
                    border: Border.all(
                        color: customChatTheme.onBackground, width: 0.3)),
                padding: EdgeInsets.only(
                    top: MySize.size6,
                    right: MySize.size12,
                    bottom: MySize.size6,
                    left: MySize.size12),
                child: Text(
                  "Go to favourites",
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: customChatTheme.onBackground,
                      fontWeight: 400,
                      letterSpacing: 0.3),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                sendMessage("Last order status");
              },
              child: Container(
                margin: EdgeInsets.only(left: MySize.size8),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size16)),
                    border: Border.all(
                        color: customChatTheme.onBackground, width: 0.3)),
                padding: EdgeInsets.only(
                    top: MySize.size6,
                    right: MySize.size12,
                    bottom: MySize.size6,
                    left: MySize.size12),
                child: Text(
                  "Last order status",
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: customChatTheme.onBackground,
                      fontWeight: 400,
                      letterSpacing: 0.3),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                sendMessage("Show my orders");
              },
              child: Container(
                margin: EdgeInsets.only(left: MySize.size8),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size16)),
                    border: Border.all(
                        color: customChatTheme.onBackground, width: 0.3)),
                padding: EdgeInsets.only(
                    top: MySize.size6,
                    right: MySize.size12,
                    bottom: MySize.size6,
                    left: MySize.size12),
                child: Text(
                  "Show my orders",
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: customChatTheme.onBackground,
                      fontWeight: 400,
                      letterSpacing: 0.3),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                sendMessage("Other services");
              },
              child: Container(
                margin: EdgeInsets.only(left: MySize.size8),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size16)),
                    border: Border.all(
                        color: customChatTheme.onBackground, width: 0.3)),
                padding: EdgeInsets.only(
                    top: MySize.size6,
                    right: MySize.size12,
                    bottom: MySize.size6,
                    left: MySize.size12),
                child: Text(
                  "Other services",
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: customChatTheme.onBackground,
                      fontWeight: 400,
                      letterSpacing: 0.3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
