import 'package:aqsaha/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'avatar.dart';

class IconBackground extends StatelessWidget {
  const IconBackground({Key? key, required this.icon, required this.onTap}) : super(key: key);
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            icon,
            size: 18,
          ),
        ),
    
      ),
    );
  }
}

class UniqueButton extends StatelessWidget {
  const UniqueButton({
    Key? key, 
    required this.icon, 
    required this.label, 
    required this.onTap
    }) : super(key: key);
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius:  BorderRadius.circular(10),
      child: InkWell(
        borderRadius:  BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 19,
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  color: AqsahaColors.textFaded
                )
              )
            ],
          ),
        ),

      ),
    );
  }
}


class IconBorder extends StatelessWidget {
  const IconBorder({
    Key? key, required this.icon, required this.onTap
    }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 2,
              color: Theme.of(context).cardColor
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              icon,
              size: 16,
            ),
          ),
        ),
    
      );
  }
}


class DryButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const DryButton({
    Key? key, 
    required this.icon, 
    required this.label, 
    required this.onTap,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius:  BorderRadius.circular(10),
      child: InkWell(
        borderRadius:  BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
               icon,
              size: 19.0,
            ),
              const SizedBox(width: 4.0,),
              Text(
                  label,
              style: const TextStyle(
                fontSize: 10
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}


class AvatarButton extends StatelessWidget {
  const AvatarButton({
    Key? key,
    required this.onTap
    }) : super(key: key);

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: onTap,
              child: const Padding(
                padding: EdgeInsets.only(left: 8, top: 3),
                child: Avatar.small(
                    url: 'assets/images/girl.jpg'),
              ),
            ),
          );
  }
}


class FollowButton extends StatelessWidget {
  final Function()? function;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  const FollowButton({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
    required this.textColor,
    this.function
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      child: TextButton(
        onPressed: function,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          width: 250,
          height: 27,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}