class Configuration {
  final String basePath;

  Configuration({
    required this.basePath,
  });
  factory Configuration.dev() => Configuration(
        basePath: r'E:\Zdjecia',
      );
  factory Configuration.prod() => Configuration(
        basePath: r'E:\Zdjecia',
      );
}
