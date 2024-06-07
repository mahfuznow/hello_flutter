import 'package:flutter/material.dart';

class NetworkImageView extends StatelessWidget {
  final String url;
  final Widget placeholder;
  final double height;
  final double width;
  final BoxFit? fit;
  final BorderRadiusGeometry borderRadius;

  const NetworkImageView({
    required this.url,
    this.placeholder = const CircularProgressIndicator(),
    this.height = double.infinity,
    this.width = double.infinity,
    this.fit,
    this.borderRadius = BorderRadius.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        url,
        fit: fit,
        height: height,
        width: width,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return frame == null ? placeholder : child;
        },
      ),
    );
  }
}
