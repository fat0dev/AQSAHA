import 'package:aqsaha/src/theme/theme.dart';
import 'package:aqsaha/src/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(11.0, 8.0, 12.0, 0.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
               const Avatar.small(url: 'assets/images/girl.jpg'),
               const SizedBox(width: 6.0,),
               Expanded(
                 child: customFieldButton(context),
               )
            ],
          ),
          // const Divider(height: 10.0, thickness: 0.5,),
          SizedBox(
            height: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: (){
                    if(kDebugMode) {
                      print("write");
                    } 
                  }, 
                  icon: const Icon(
                    CupertinoIcons.question_square,
                    ),
                  label: const Text("Ask")),
                  const VerticalDivider(width: 8.0,),
                TextButton.icon(
                  onPressed: (){
                    if(kDebugMode) {
                      print("Answer");
                    } 
                  }, 
                  icon: const Icon(
                    CupertinoIcons.pencil_ellipsis_rectangle,
                    ),
                  label: const Text("Answer")),
                const VerticalDivider(width: 8.0,),
                TextButton.icon(
                  onPressed: (){
                    if(kDebugMode) {
                      print("Post");
                    } 
                  }, 
                  icon: const Icon(
                    CupertinoIcons.pen,
                    ),
                  label: const Text("Post")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customFieldButton(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: (){},
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
          ),
          child: const Text(
              "What do you want to ask or share?",
              style: TextStyle(
                fontSize: 10,
                color: AqsahaColors.textFaded,
                letterSpacing: 0.3,
                overflow: TextOverflow.ellipsis
              ),
            )))
    );
  }


  Widget textField() {
    return TextField(
                   onTap: (){
                    
                   },
                   decoration: InputDecoration(
                     hintText: "What do you want to ask or share?",
                     hintStyle: const TextStyle(
                       fontSize: 12,
                      
                     ),
                     contentPadding: const EdgeInsets.all(6.0),
                     isCollapsed: true,
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20.0),
                       // gapPadding: 5.0
                     )
                   ),
                 );
  }
}