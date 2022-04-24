class Configuration {
  final String thumbnailsFolder = r'thumbnails';

  final String basePath;
  final String dbPath;
  final int thumbnailMaxSize;
  final bool forceRegenThumbnails;

  Configuration({
    required this.basePath,
    required this.dbPath,
    required this.thumbnailMaxSize,
    required this.forceRegenThumbnails,
  });

  factory Configuration.dev() => Configuration(
        basePath: r'C:\Users\Kopac\Desktop\hasher',
        dbPath: r'C:\Users\Kopac\Desktop\hasher\db',
        thumbnailMaxSize: 250,
        forceRegenThumbnails: true,
      );
  factory Configuration.prod() => Configuration(
        basePath: r'E:\Zdjecia',
        dbPath: r'E:\Zdjecia\db',
        thumbnailMaxSize: 250,
        forceRegenThumbnails: false,
      );
}
