import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ZoomableImage extends StatefulWidget {
final String imageUrl;
ZoomableImage({required this.imageUrl});
@override
_ZoomableImageState createState() => _ZoomableImageState();
}
class _ZoomableImageState extends State<ZoomableImage> {
double _minScale = 1.0;
double _maxScale = 3.0;
@override
Widget build(BuildContext context) {
return InteractiveViewer(
minScale: _minScale,
maxScale: _maxScale,
child: CachedNetworkImage(
imageUrl: widget.imageUrl,
fit: BoxFit.contain,
placeholder: (context, url) => CircularProgressIndicator(),
errorWidget: (context, url, error) => Icon(Icons.error),
),
);
}
}