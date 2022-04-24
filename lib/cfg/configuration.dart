class Configuration {
  final String thumbnailsFolder = r'thumbnails';

  final String basePath;
  final int thumbnailMaxSize;
  final bool forceRegenThumbnails;

  Configuration({
    required this.basePath,
    required this.thumbnailMaxSize,
    required this.forceRegenThumbnails,
  });

  factory Configuration.dev() => Configuration(
        basePath: r'C:\Users\Kopac\Desktop\hasher',
        thumbnailMaxSize: 250,
        forceRegenThumbnails: false,
      );
  factory Configuration.prod() => Configuration(
        basePath: r'E:\Zdjecia',
        thumbnailMaxSize: 250,
        forceRegenThumbnails: false,
      );
}
