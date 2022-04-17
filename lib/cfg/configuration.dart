class Configuration {
  final String thumbnailsFolder = r'thumbnails';

  final String basePath;
  final int thumbnailMaxSize;

  Configuration({
    required this.basePath,
    required this.thumbnailMaxSize,
  });

  factory Configuration.dev() => Configuration(
        basePath: r'C:\Users\Kopac\Desktop\hasher',
        thumbnailMaxSize: 50,
      );
  factory Configuration.prod() => Configuration(
        basePath: r'E:\Zdjecia',
        thumbnailMaxSize: 250,
      );
}
