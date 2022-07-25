/// Convert enum to String
String enumToString(Object o) => o.toString().split('.').last;

/// Get Enum from String
// T enumFromString<T>(String key, List<T> values) =>
//     values.firstWhere((v) => key.toLowerCase() == enumToString(v!).toLowerCase(), orElse: () => values.last);

T enumFromString<T>(String key, List<T> values) => values.firstWhere(
      (v) =>
          key.toLowerCase().replaceAll('_', '') ==
          enumToString(v!).toLowerCase().replaceAll('_', ''),
      orElse: () => values.last,
    );

// double formatDouble(dynamic value) => value == null
//     ? 0.0
//     : value * 1.0;

/// Get Absolute value from double (Positive value).
double absDouble(double value) => value < 0 ? -value : value;
