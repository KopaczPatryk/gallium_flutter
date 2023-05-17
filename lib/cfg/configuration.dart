enum Configuration {
  dev(
    preferencesPrefix: 'dev',
    thumbnailMaxSize: 250,
    forceRegenThumbnails: false,
    forceClearPreferences: false,
    splashScreenDuration: Duration(milliseconds: 100),
  ),
  prod(
    preferencesPrefix: 'prod',
    thumbnailMaxSize: 250,
    forceRegenThumbnails: false,
    forceClearPreferences: false,
    splashScreenDuration: Duration(seconds: 3),
  );

  final String thumbnailsFolder = 'thumbnails';
  final String databaseFolder = 'database';

  final int thumbnailMaxSize;
  final bool forceRegenThumbnails;
  final bool forceClearPreferences;
  final String preferencesPrefix;
  final Duration splashScreenDuration;

  const Configuration({
    required this.thumbnailMaxSize,
    required this.forceRegenThumbnails,
    required this.forceClearPreferences,
    required this.preferencesPrefix,
    required this.splashScreenDuration,
  });
}
