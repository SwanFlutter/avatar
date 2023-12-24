// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:avatar/src/tools/gradiant_random_tools.dart';
import 'package:flutter/material.dart';
import 'tools/text_to-color.dart';
import 'widget/avatar_circle.dart';
import 'widget/profile.dart';
import 'dart:io';

typedef OnPickerChange = void Function(File file);

class Avatar {
  Avatar._();

  static Widget avatarCircle({
    /// [onTapAvatar]: A callback function for when the avatar is tapped.
    void Function()? onTapAvatar,

    /// [widthBorder]: The border width of the profile (default: 0.0).
    final double widthBorder = 0.0,

    /// [radius]: The radius of the profile.
    final double? radius,

    /// [image]: The imageAssets for the profile.
    final String? image,

    /// [imageNetwork]: The image URL for the profile.
    final String? imageNetwork,

    /// [backgroundColor]: The background color of the profile (can be null).
    Color? backgroundColor,

    /// [gradientBackgroundColor]: The gradient background of the profile (can be null).
    Gradient? gradientBackgroundColor,

    /// [gradientWidthBorder]: The gradient for the profile's border (default: linear gradient from blue to deep purple).
    Gradient? gradientWidthBorder =
        const LinearGradient(colors: [Colors.blue, Colors.deepPurple]),

    /// [colorShadow]: The shadow color of the profile (can be null).
    final Color? colorShadow,

    /// [offsetX]: The horizontal shadow offset (can be null).
    final double? offsetX,

    /// [offsetY]: The vertical shadow offset (can be null).
    final double? offsetY,

    /// [blurRadius]: The shadow blur radius (can be null).
    final double? blurRadius,

    /// [text]: The text to display on the profile.
    required String? text,

    /// [style]: The text style (default: font size 25, white color, and bold).
    final TextStyle? style = const TextStyle(
        fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),

    /// [randomColor]: A boolean flag for randomizing the background color of the profile.
    bool randomColor = true,

    /// [randomGradient]: A boolean flag for randomizing the background gradient of the profile.
    bool randomGradient = false,

    /// The isBorderAvatar parameter, if true, creates a border for the avatar.
    /// This border contains a circular border with a default width of 5 and a color of LinearGradient.
    /// If this parameter is false, no border will be created for the avatar.
    final bool isBorderAvatar = false,
  }) {
    if (randomColor) {
      backgroundColor = TextToColor.toColor(text!);
    } else if (randomGradient) {
      gradientBackgroundColor =
          GradiantRandomTools.getGradient(text.toString());
    } else {
      backgroundColor = backgroundColor;
    }

    return AvatarCircle(
      onTapAvatar: onTapAvatar,
      widthBorder: widthBorder,
      radius: radius,
      image: image,
      imageNetwork: imageNetwork,
      backgroundColor: backgroundColor,
      gradientBackgroundColor: gradientBackgroundColor,
      gradientWidthBorder: gradientWidthBorder,
      colorShadow: colorShadow,
      offsetX: offsetX,
      offsetY: offsetY,
      blurRadius: blurRadius,
      text: text,
      style: style,
      randomColor: randomColor,
      randomGradient: randomGradient,
      isBorderAvatar: isBorderAvatar,
    );
  }

  static Widget profile({
    final double widthBorder = 0.0,
    double? radius = 35,
    final String? image,
    final String? imageNetwork,
    Color? backgroundColor,
    Gradient? gradientBackgroundColor,
    Gradient? gradientWidthBorder =
        const LinearGradient(colors: [Colors.blue, Colors.deepPurple]),
    final Color? colorShadow,
    final double? offsetX,
    final double? offsetY,
    final double? blurRadius,
    required String? text,
    final TextStyle? style = const TextStyle(
        fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
    final Color backgroundColorCamera = Colors.white,
    final IconData? icon = Icons.camera,
    final Color iconColor = Colors.black,
    bool randomColor = true,
    bool randomGradient = false,
    final OnPickerChange? onPickerChange,

    /// The isBorderAvatar parameter, if true, creates a border for the avatar.
    /// This border contains a circular border with a default width of 5 and a color of LinearGradient.
    /// If this parameter is false, no border will be created for the avatar.
    final bool isBorderAvatar = false,
  }) {
    if (randomColor) {
      backgroundColor = TextToColor.toColor(text!);
    } else if (randomGradient) {
      gradientBackgroundColor =
          GradiantRandomTools.getGradient(text.toString());
    } else {
      backgroundColor = backgroundColor;
    }
    return Profile(
      widthBorder: widthBorder,
      radius: radius,
      image: image,
      imageNetwork: imageNetwork,
      backgroundColor: backgroundColor,
      gradientWidthBorder: gradientWidthBorder,
      gradientBackgroundColor: gradientBackgroundColor,
      colorShadow: colorShadow,
      offsetX: offsetX,
      offsetY: offsetY,
      blurRadius: blurRadius,
      text: text,
      style: style,
      backgroundColorCamera: backgroundColorCamera,
      icon: icon,
      iconColor: iconColor,
      randomColor: randomColor,
      randomGradient: randomGradient,
      onPickerChange: onPickerChange,
      isBorderAvatar: isBorderAvatar,
    );
  }
}
