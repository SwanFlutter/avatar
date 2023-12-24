// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:avatar/src/tools/gradient_circle_painter.dart';
import 'package:flutter/material.dart';

import '../tools/gradiant_random_tools.dart';
import '../tools/text_to-color.dart';

extension AvatarCircleExtensions on AvatarCircle {
  static String initials(String text) {
    String result = "";
    List<String> words = text.split(" ");
    for (var text in words) {
      if (text.trim().isNotEmpty && result.length < 2) {
        result += text[0].trim();
      }
    }
    return result.trim().toUpperCase();
  }
}

class AvatarCircle extends StatelessWidget {
  void Function()? onTapAvatar;
  final double widthBorder;
  final double? radius;
  final String? image;
  final String? imageNetwork;
  Color? backgroundColor;
  Gradient? gradientBackgroundColor;
  Gradient? gradientWidthBorder;
  final Color? colorShadow;
  final double? offsetX;
  final double? offsetY;
  final double? blurRadius;
  final String? text;
  final TextStyle? style;
  final bool isBorderAvatar;

  AvatarCircle({
    Key? key,
    required this.text,
    this.onTapAvatar,
    this.radius = 35,
    this.image,
    this.imageNetwork,
    this.backgroundColor,
    this.gradientBackgroundColor,
    this.gradientWidthBorder =
        const LinearGradient(colors: [Colors.blue, Colors.deepPurple]),
    this.colorShadow,
    this.offsetX,
    this.offsetY,
    this.blurRadius,
    this.widthBorder = 5.0,
    this.isBorderAvatar = false,
    this.style = const TextStyle(
        fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
    bool randomColor = true,
    bool randomGradient = false,
  }) : super(key: key) {
    if (randomColor) {
      backgroundColor = TextToColor.toColor(text);
    } else if (randomGradient) {
      gradientBackgroundColor =
          GradiantRandomTools.getGradient(text.toString());
    } else {
      backgroundColor = backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    File? imagePicker;
    return InkResponse(
      onTap: onTapAvatar,
      child: isBorderAvatar
          ? CustomPaint(
              painter: GradientCirclePainter(
                gradientColors: gradientWidthBorder,
                withBorder: widthBorder,
              ),
              child: Container(
                alignment: Alignment.center,
                height: radius != null ? radius! * 2.2 : 35,
                width: radius != null ? radius! * 2.2 : 35,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  gradient: gradientBackgroundColor,
                  shape: BoxShape.circle,
                  // ignore: unnecessary_null_comparison
                  image: imagePicker != null
                      ? DecorationImage(
                          image: FileImage(imagePicker),
                          fit: BoxFit.cover,
                        )
                      : imageNetwork != null
                          ? DecorationImage(
                              image: Image.network(imageNetwork!).image,
                              fit: BoxFit.cover,
                            )
                          : image != null
                              ? DecorationImage(
                                  image: Image.asset(image!).image,
                                  fit: BoxFit.cover,
                                )
                              : null,
                  boxShadow: [
                    BoxShadow(
                      color: colorShadow ?? Colors.grey,
                      offset: Offset(offsetX ?? 0.0, offsetY ?? 3.0), //(x,y)
                      blurRadius: blurRadius ?? 6.0,
                    ),
                  ],
                ),
                // ignore: unnecessary_null_comparison
                child: (imagePicker == null &&
                        imageNetwork == null &&
                        image == null &&
                        text != null)
                    ? Text(
                        AvatarCircleExtensions.initials(text!),
                        style: style,
                      )
                    : const Text(''),
              ),
            )
          : Container(
              alignment: Alignment.center,
              height: radius != null ? radius! * 2.2 : 35,
              width: radius != null ? radius! * 2.2 : 35,
              decoration: BoxDecoration(
                color: backgroundColor,
                gradient: gradientBackgroundColor,
                shape: BoxShape.circle,
                // ignore: unnecessary_null_comparison
                image: imagePicker != null
                    ? DecorationImage(
                        image: FileImage(imagePicker),
                        fit: BoxFit.cover,
                      )
                    : imageNetwork != null
                        ? DecorationImage(
                            image: Image.network(imageNetwork!).image,
                            fit: BoxFit.cover,
                          )
                        : image != null
                            ? DecorationImage(
                                image: Image.asset(image!).image,
                                fit: BoxFit.cover,
                              )
                            : null,
                boxShadow: [
                  BoxShadow(
                    color: colorShadow ?? Colors.grey,
                    offset: Offset(offsetX ?? 0.0, offsetY ?? 3.0), //(x,y)
                    blurRadius: blurRadius ?? 6.0,
                  ),
                ],
              ),
              // ignore: unnecessary_null_comparison
              child: (imagePicker == null &&
                      imageNetwork == null &&
                      image == null &&
                      text != null)
                  ? Text(
                      AvatarCircleExtensions.initials(text!),
                      style: style,
                    )
                  : const Text(''),
            ),
    );
  }
}
