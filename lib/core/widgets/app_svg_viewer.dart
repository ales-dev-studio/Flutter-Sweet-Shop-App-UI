import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgViewer extends StatelessWidget {
  const AppSvgViewer(
    this.path, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit,
  });

  final String path;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      fit: fit ?? BoxFit.contain,
    );
  }
}
