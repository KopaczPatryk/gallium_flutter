class Configuration {
  final String thumbnailsFolder = 'thumbnails';
  final String databaseFolder = 'database';

  final int thumbnailMaxSize;
  final bool forceRegenThumbnails;
  final bool forceClearPreferences;
  final String preferencesPrefix;
  final Duration splashScreenDuration;

  Configuration({
    required this.thumbnailMaxSize,
    required this.forceRegenThumbnails,
    required this.forceClearPreferences,
    required this.preferencesPrefix,
    required this.splashScreenDuration,
  });

  factory Configuration.dev() => Configuration(
        preferencesPrefix: 'dev',
        thumbnailMaxSize: 250,
        forceRegenThumbnails: false,
        forceClearPreferences: false,
        splashScreenDuration: const Duration(milliseconds: 100),
      );
  factory Configuration.prod() => Configuration(
        preferencesPrefix: 'prod',
        thumbnailMaxSize: 250,
        forceRegenThumbnails: false,
        forceClearPreferences: false,
        splashScreenDuration: const Duration(seconds: 3),
      );
}
