
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/models.dart';
import '../theme/theme.dart';
import 'widgets.dart';

class PostContainer extends StatefulWidget {
  final Post post;
  const PostContainer({
    Key? key,
    required this.post,
}) : super(key: key);

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: widget.post,),
                const SizedBox(height: 4.0,),
                Text(widget.post.description),
                (widget.post.profImage.isNotEmpty) ? const SizedBox.shrink() 
                  : const SizedBox(height: 6.0,) 
              ],
            ),
          ),
         ( widget.post.postUrl.isNotEmpty) 
          ? Padding(
            padding: const EdgeInsets.symmetric(vertical:  5.0, horizontal: 5.0),
            child: CachedNetworkImage(imageUrl: widget.post.profImage),
          ) 
          : const SizedBox.shrink(),
          _PostStats(post: widget.post)
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({
    Key? key,
    required this.post,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
     ProfileAvater(imageUrl: post.profImage),
     const SizedBox(width: 8.0,),
     Expanded(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          Row(
            children: [
              Text(post.username, style: const TextStyle(
                fontWeight: FontWeight.w600,
                  ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: (){},
                  child: const Text(
                    "Follow",
                    style: TextStyle(
                      fontSize: 10
                    ),
                    
                    )),
              )
            ],
          ),
          Row(
            children: [
              Text("${post.datePublished} • ", style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12.0,
              ),),
              Icon(Icons.public, 
              color: Colors.grey.shade600,
              size: 12.0,
              ),
            ],
          )
         ],
       ),
     ),
       InkWell(
         borderRadius: BorderRadius.circular(10),
         onTap: (){
       if (kDebugMode) {
         print("more");
       }
     }, child: const Padding(
       padding: EdgeInsets.all(5.0),
       child: Icon(Icons.more_horiz),
     ))
    ],);
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({
    Key? key,
    required this.post,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).cardColor,
                ),
              ),
              padding: const EdgeInsets.all(1),
              child: Row(
                children: [
                  const VerticalDivider(
                    width: 3,
                  ),
                  UniqueButton(
                      icon: MdiIcons.arrowUpBoldBoxOutline,
                      label: '${post.likes}',
                      onTap: (){},
                    ),
                  VerticalDivider(
                    color: Theme.of(context).dividerColor,
                    width: 0.5,
                  ),
                  UniqueButton(
                    icon: MdiIcons.arrowDownBoldBoxOutline,
                    label: '',
                    onTap: (){},
                  ),
                ],
              ),
            ),
        const VerticalDivider(
          width: 3,
        ),
        DryButton(
          icon: MdiIcons.chatOutline,
          label: post.description,
          onTap: (){
            if (kDebugMode) {
              print('Comments');
            }
          }
        ),
        const VerticalDivider(
          width: 3,
        ),
        DryButton(
          icon: MdiIcons.shareOutline,
          label: post.description,
          onTap: (){
            if (kDebugMode) {
              print('Share');
            }
          }
        ),
      ],
    );
  }
}
