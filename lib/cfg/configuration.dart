class Configuration {
  final String basePath;

  Configuration({
    required this.basePath,
  });
  factory Configuration.dev() => Configuration(
        basePath: 'E:\Zdjecia',
      );
  factory Configuration.prod() => Configuration(
        basePath: 'E:\Zdjecia',
      );
}
