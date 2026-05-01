import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Brand
  static const primary = Color(0xFF5B4FE8);
  static const primaryDark = Color(0xFF3D33C4);
  static const primaryLight = Color(0xFFEDEBFF);
  static const primaryGlow = Color(0x335B4FE8);

  // Semantic
  static const accent = Color(0xFFFF5C7A);
  static const success = Color(0xFF00C48C);
  static const warning = Color(0xFFFFB547);
  static const info = Color(0xFF0EA5E9);

  // Surfaces
  static const background = Color(0xFFF5F4FF);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceElevated = Color(0xFFFAF9FF);
  static const border = Color(0xFFE8E6FF);

  // Text
  static const textPrimary = Color(0xFF1C1644);
  static const textSecondary = Color(0xFF7B74A8);
  static const textHint = Color(0xFFB0ABCC);

  // Kit colors — rich, distinct palette
  static const kitFormation = Color(0xFF5B4FE8);
  static const kitHR = Color(0xFF0EA5E9);
  static const kitSOP = Color(0xFFFFB547);
  static const kitProduct = Color(0xFF00C48C);
  static const kitProcurement = Color(0xFFFF5C7A);
  static const kitBusiness = Color(0xFF8B5CF6);
  static const kitFinance = Color(0xFF06B6D4);
}

class AppGradients {
  static const hero = LinearGradient(
    colors: [Color(0xFF5B4FE8), Color(0xFF8B7FF0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Subtle premium card sheen — barely-there gradient that catches light
  static const card = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFFAFAFE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Glassy header overlay
  static LinearGradient glassOverlay(Color base) => LinearGradient(
        colors: [
          base.withValues(alpha: 0.95),
          base.withValues(alpha: 0.75),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

  static LinearGradient forKit(Color color) => LinearGradient(
        colors: [color, Color.lerp(color, Colors.white, 0.28)!],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}

/// Industry-standard layered shadow system. Use these instead of
/// hand-rolling BoxShadow lists — keeps depth consistent across the app.
class AppShadows {
  static const xs = [
    BoxShadow(
      color: Color(0x080F0A2C),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];

  static const sm = [
    BoxShadow(
      color: Color(0x0C0F0A2C),
      blurRadius: 10,
      offset: Offset(0, 2),
    ),
  ];

  static const md = [
    BoxShadow(
      color: Color(0x0F0F0A2C),
      blurRadius: 18,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x080F0A2C),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  static const lg = [
    BoxShadow(
      color: Color(0x140F0A2C),
      blurRadius: 32,
      offset: Offset(0, 12),
    ),
    BoxShadow(
      color: Color(0x0A0F0A2C),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ];

  // Tinted glow — use sparingly on hero cards for premium feel
  static List<BoxShadow> glow(Color tint) => [
        BoxShadow(
          color: tint.withValues(alpha: 0.18),
          blurRadius: 28,
          offset: const Offset(0, 8),
          spreadRadius: -4,
        ),
        BoxShadow(
          color: tint.withValues(alpha: 0.10),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];
}

/// Reusable spacing scale — match Tailwind's 4-pt rhythm.
class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 20.0;
  static const xxl = 28.0;
  static const xxxl = 40.0;
}

/// Reusable radius scale.
class AppRadius {
  static const xs = 8.0;
  static const sm = 10.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 20.0;
  static const xxl = 28.0;
}

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        surface: AppColors.surface,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: GoogleFonts.plusJakartaSansTextTheme().apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ).copyWith(
        // Tighter letter-spacing on display + headlines (premium feel)
        displayLarge: GoogleFonts.plusJakartaSans(
          fontSize: 56,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.4,
          height: 1.05,
          color: AppColors.textPrimary,
        ),
        displayMedium: GoogleFonts.plusJakartaSans(
          fontSize: 44,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.0,
          height: 1.08,
          color: AppColors.textPrimary,
        ),
        headlineLarge: GoogleFonts.plusJakartaSans(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.6,
          height: 1.15,
          color: AppColors.textPrimary,
        ),
        headlineMedium: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.4,
          height: 1.2,
          color: AppColors.textPrimary,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          fontSize: 19,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
          color: AppColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.plusJakartaSans(
          fontSize: 15,
          height: 1.55,
          color: AppColors.textPrimary,
        ),
        bodyMedium: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          height: 1.5,
          color: AppColors.textPrimary,
        ),
        bodySmall: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          height: 1.45,
          color: AppColors.textSecondary,
        ),
        labelLarge: GoogleFonts.plusJakartaSans(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
          color: AppColors.textSecondary,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
          color: AppColors.textPrimary,
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.border, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        hintStyle: const TextStyle(color: AppColors.textHint),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      ),
    );
  }
}
