# ProGuard / R8 rules for Gestura
# Code shrinking and resource shrinking safe-guards

# Flutter Wrapper & Plugins
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Google Mobile Ads (AdMob)
-keep public class com.google.android.gms.ads.** {
   public *;
}
-keep public class com.google.ads.** {
   public *;
}
-dontwarn com.google.android.gms.ads.**

# Flutter TTS
-keep class com.tundralabs.fluttertts.** { *; }

# Audioplayers
-keep class xyz.luan.audioplayers.** { *; }

# Shared Preferences
-keep class io.flutter.plugins.sharedpreferences.** { *; }

# Preserve Line Numbers for Crashlytics / Stack traces
-keepattributes SourceFile,LineNumberTable

# Flutter Deferred Components / Play Core optional dependency
-dontwarn com.google.android.play.core.**

