import 'package:flutter/material.dart';
import 'package:groshop/Locale/locales.dart';

class CustomButton extends StatefulWidget {
  final String? label;
  final Widget? onPress;
  final double? width;
  final Widget? prefixIcon;
  final double? iconGap;
  final double? height;
  final VoidCallback? onTap;
  final Color? color;
  final double? margin;
  final double? padding;
  final double? radius;

  CustomButton({
    this.label,
    this.onPress,
    this.width,
    this.prefixIcon,
    this.iconGap,
    this.height,
    this.onTap,
    this.color,
    this.margin,
    this.radius,
    this.padding
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: EdgeInsets.fromLTRB(widget.margin??0, 0, widget.margin??0, 0),
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          primary: widget.color ?? Colors.green,
          shadowColor: Colors.grey,
          elevation: 5,
          padding: EdgeInsets.all(widget.padding??0),
          textStyle: TextStyle(
              fontSize: 16,
              color: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
              letterSpacing: 1,
              fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius??0), // <-- Radius
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.prefixIcon != null ? widget.prefixIcon! : SizedBox.shrink(),
            SizedBox(width: widget.iconGap),
            Text(
              widget.label ?? "Tiếp tục",
              textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
