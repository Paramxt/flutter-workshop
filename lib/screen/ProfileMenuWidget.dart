import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_workshop/constants/color.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? PrimaryColor : AccentColor;

    return ListTile(
      onTap: onPress,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      leading: Padding(
        padding: const EdgeInsets.only(left: 0.0), // Adjust padding if needed
        child: Container(
          width: 30, // Adjust width if needed
          height: 30, // Adjust height if needed
          child: Center(
            child: Icon(
              icon,
              color: SecondaryColor,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Padding(
              padding:
                  const EdgeInsets.only(right: 0.0), // Adjust padding if needed
              child: Container(
                width: 30, // Adjust width if needed (optional)
                height: 30, // Adjust height if needed (optional)
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18.0,
                  color: Colors.grey,
                ),
              ),
            )
          : null,
    );
  }
}
