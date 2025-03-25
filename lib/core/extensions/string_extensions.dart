extension StringExtensions on String {
  /// Capitalizes the first letter of the string.
  String profileText() {
    if (isEmpty) return this;
    return   this[0].toUpperCase();
  }
}
