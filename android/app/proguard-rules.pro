# Flutter
-keep class io.flutter.** { *; }
-keep class io.flutter.embedding.** { *; }

# Suppress missing Google Play Core classes (Flutter deferred components — not used in this app)
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }

# GetX
-keep class com.get.** { *; }

# GetStorage
-keep class com.storage.** { *; }
