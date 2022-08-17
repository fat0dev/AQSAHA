

import 'package:aqsaha/src/models/models.dart';
import 'package:aqsaha/src/theme/theme.dart';
import 'package:aqsaha/src/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ChatRoom extends StatelessWidget {
  static Route route(MessageData data) => MaterialPageRoute(
    builder: (context) => ChatRoom(messageData: data));
  const ChatRoom({
    Key? key,
    required this.messageData,
    }) : super(key: key);
  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: CupertinoIcons.back,
            onTap: (){
              Navigator.pop(context);
            },
          )
        ),
        title: _AppBarTitle(
          messageData: messageData,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.video_camera_solid,
                onTap: (){},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.phone,
                onTap: (){},
              ),
            ),
          ),
        ],
      ),
      body: const _DemoMessageList()
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(url: messageData.profilePic),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageData.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14
                ),
              ),
              const SizedBox(height: 2,),
              const Text(
                "Online now",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}

class _DemoMessageList extends StatelessWidget {
  const _DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: const [
          _DateLable(label: 'Friday'),
          _MessageTile(
            message: 'Hello, Is This Aqsaha Support?', 
            messageData: '12:00 PM'),
          _MessageOwnTile(
            message: 'Yes, How we can help you?', 
            messageData: '12:01 PM'),
            _MessageTile(
            message: 'I am just asking', 
            messageData: '12:02 PM'),
          _MessageOwnTile(
            message: 'Fine ', 
            messageData: '12:04 PM'),
            
        ],
      ),
    );
  }
}

class _DateLable extends StatelessWidget {
  const _DateLable({
    Key? key, 
    required this.label,
    }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AqsahaColors.textFaded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({Key? key, required this.message, required this.messageData}) : super(key: key);
  final String message;
  final String messageData;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Text(message),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                messageData,
                style: const TextStyle(
                  color: AqsahaColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
  const _MessageOwnTile({Key? key, required this.message, required this.messageData}) : super(key: key);
  final String message;
  final String messageData;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AqsahaColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomLeft: Radius.circular(_borderRadius)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Text(message),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                messageData,
                style: const TextStyle(
                  color: AqsahaColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}