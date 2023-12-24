// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../tools/gradiant_random_tools.dart';
import '../tools/gradient_circle_painter.dart';
import '../tools/image_tools.dart';
import '../tools/text_to-color.dart';

typedef OnPickerChange = void Function(File file);

extension ProfileExtensions on Profile {
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

class Profile extends StatefulWidget {
  final double widthBorder;
  double? radius;
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
  final Color backgroundColorCamera;
  final IconData? icon;
  final Color iconColor;
  final OnPickerChange? onPickerChange;
  final bool isBorderAvatar;
  Profile({
    Key? key,
    required this.radius,
    required this.text,
    this.onPickerChange,
    this.image,
    this.imageNetwork,
    this.gradientBackgroundColor,
    this.colorShadow,
    this.offsetX,
    this.offsetY,
    this.blurRadius,
    this.isBorderAvatar = false,
    this.backgroundColor = Colors.green,
    this.gradientWidthBorder =
        const LinearGradient(colors: [Colors.blue, Colors.deepPurple]),
    this.iconColor = Colors.black,
    this.widthBorder = 5.0,
    this.backgroundColorCamera = Colors.white,
    this.icon = Icons.camera,
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
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? image;
  ImageTools imageModel = ImageTools();

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: Stack(
        children: [
          widget.isBorderAvatar
              ? CustomPaint(
                  painter: GradientCirclePainter(
                    gradientColors: widget.gradientWidthBorder,
                    withBorder: widget.widthBorder,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: widget.radius != null ? widget.radius! * 2.2 : 35,
                    width: widget.radius != null ? widget.radius! * 2.2 : 35,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      gradient: widget.gradientBackgroundColor,
                      shape: BoxShape.circle,
                      image: image != null
                          ? DecorationImage(
                              image: FileImage(image!),
                              fit: BoxFit.cover,
                            )
                          : widget.imageNetwork != null
                              ? DecorationImage(
                                  image:
                                      Image.network(widget.imageNetwork!).image,
                                  fit: BoxFit.cover,
                                )
                              : widget.image != null
                                  ? DecorationImage(
                                      image: Image.asset(widget.image!).image,
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                      boxShadow: [
                        BoxShadow(
                          color: widget.colorShadow ?? Colors.grey,
                          offset: Offset(
                              widget.offsetX ?? 0.0, widget.offsetY ?? 3.0),
                          blurRadius: widget.blurRadius ?? 6.0,
                        ),
                      ],
                    ),
                    child: (image == null &&
                            widget.imageNetwork == null &&
                            widget.image == null &&
                            widget.text != null)
                        ? Text(
                            ProfileExtensions.initials(widget.text!),
                            style: widget.style,
                          )
                        : const Text(''),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  height: widget.radius != null ? widget.radius! * 2.2 : 35,
                  width: widget.radius != null ? widget.radius! * 2.2 : 35,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    gradient: widget.gradientBackgroundColor,
                    shape: BoxShape.circle,
                    image: image != null
                        ? DecorationImage(
                            image: FileImage(image!),
                            fit: BoxFit.cover,
                          )
                        : widget.imageNetwork != null
                            ? DecorationImage(
                                image:
                                    Image.network(widget.imageNetwork!).image,
                                fit: BoxFit.cover,
                              )
                            : widget.image != null
                                ? DecorationImage(
                                    image: Image.asset(widget.image!).image,
                                    fit: BoxFit.cover,
                                  )
                                : null,
                    boxShadow: [
                      BoxShadow(
                        color: widget.colorShadow ?? Colors.grey,
                        offset: Offset(
                            widget.offsetX ?? 0.0, widget.offsetY ?? 3.0),
                        blurRadius: widget.blurRadius ?? 6.0,
                      ),
                    ],
                  ),
                  child: (image == null &&
                          widget.imageNetwork == null &&
                          widget.image == null &&
                          widget.text != null)
                      ? Text(
                          ProfileExtensions.initials(widget.text!),
                          style: widget.style,
                        )
                      : const Text(''),
                ),
          Positioned(
            bottom: widget.radius != null ? widget.radius! / 11 : 0,
            right: widget.radius != null
                ? widget.radius! / 11
                : 0, // نصف ارتفاع AvatarCircle
            child: InkResponse(
              onTap: () {
                customBottomPickerImage();
                // Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: widget.radius != null ? widget.radius! / 3.5 : 0,
                backgroundColor: widget.backgroundColorCamera,
                child: Icon(
                  widget.icon,
                  color: widget.iconColor,
                  size: widget.radius != null ? widget.radius! / 2 : 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void customBottomPickerImage() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        Size size = MediaQuery.of(context).size;
        return SizedBox(
          width: size.width,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final file =
                      await imageModel.pickImage(ImageSource.gallery, false);

                  if (file.isNotEmpty) {
                    final croppedFile =
                        await imageModel.crop(file.first, CropStyle.circle);
                    if (croppedFile != null) {
                      setState(() {
                        image = File(croppedFile.path);
                        widget.onPickerChange?.call(image!);
                      });
                    }
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: Material(
                  borderRadius: BorderRadius.circular(12.0),
                  elevation: 5,
                  color: Colors.grey[100],
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width * 0.90,
                    height: 50,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                        ),
                        Text("Browse Gallery")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Or"),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () async {
                  final file =
                      await imageModel.pickImage(ImageSource.camera, false);

                  if (file.isNotEmpty) {
                    final croppedFile =
                        await imageModel.crop(file.first, CropStyle.circle);
                    if (croppedFile != null) {
                      setState(() {
                        image = File(croppedFile.path);
                        widget.onPickerChange?.call(image!);
                      });
                    }
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: Material(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.0),
                  elevation: 5,
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width * 0.90,
                    height: 50,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt_outlined),
                        Text("Usa camera"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
