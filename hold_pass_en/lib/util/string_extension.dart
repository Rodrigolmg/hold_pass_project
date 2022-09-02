extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String replaceBlank(){
    return trim().isEmpty ? '-' : this;
  }
}