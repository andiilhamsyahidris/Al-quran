// colors
import 'package:flutter/material.dart';

const Color kDarkPurple = Color(0xFF363062);
const Color kMediumPurple = Color(0xFF4D4C7D);
const Color kSecondary = Color(0xFF827397);
const Color kPrimary = Color(0xFFD8B9C3);

const kColorScheme = ColorScheme(
    primary: kDarkPurple,
    primaryContainer: kDarkPurple,
    secondary: kMediumPurple,
    secondaryContainer: kSecondary,
    surface: kPrimary,
    background: kPrimary,
    error: Colors.red,
    onPrimary: kDarkPurple,
    onSecondary: kMediumPurple,
    onSurface: kPrimary,
    onBackground: kPrimary,
    onError: kSecondary,
    brightness: Brightness.light);
