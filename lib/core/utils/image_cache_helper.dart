import 'package:flutter/material.dart';

class ImageCacheHelper {
  // Precache critical images for better mobile performance
  static Future<void> precacheImages(BuildContext context, List<String> imagePaths) async {
    for (String path in imagePaths) {
      try {
        await precacheImage(AssetImage(path), context);
      } catch (e) {
        debugPrint('Failed to precache image: $path - $e');
      }
    }
  }

  // Optimized image widget with caching and error handling
  static Widget cachedImage({
    required String imagePath,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      cacheWidth: width != null ? (width * 2).toInt() : null, // Cache at 2x for retina displays
      cacheHeight: height != null ? (height * 2).toInt() : null,
      errorBuilder: (context, error, stackTrace) {
        debugPrint('Error loading image: $imagePath - $error');
        return errorWidget ?? Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, color: Colors.grey),
        );
      },
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: child,
        );
      },
    );
  }

  // Lazy load image with placeholder
  static Widget lazyLoadImage({
    required String imagePath,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
  }) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 100)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return cachedImage(
            imagePath: imagePath,
            width: width,
            height: height,
            fit: fit,
            placeholder: placeholder,
          );
        }
        return placeholder ?? Container(
          width: width,
          height: height,
          color: Colors.grey[200],
        );
      },
    );
  }
}
