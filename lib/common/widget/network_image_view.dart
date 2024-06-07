import 'package:flutter/material.dart';
import 'package:hello_flutter/values/dimens.dart';

class NetworkImageView extends StatelessWidget {
  final String url;
  final Widget? placeholder;
  final double height;
  final double width;
  final BoxFit? fit;
  final BorderRadiusGeometry borderRadius;

  const NetworkImageView({
    required this.url,
    this.placeholder,
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
          return frame == null ? placeholder ?? _placeholder() : child;
        },
      ),
    );
  }

  Widget _placeholder() {
    return Padding(
      padding: EdgeInsets.all(Dimens.dimen_8),
      child: const CircularProgressIndicator(),
    );
  }
}
