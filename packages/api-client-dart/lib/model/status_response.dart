//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusResponse {
  /// Returns a new [StatusResponse] instance.
  StatusResponse({
    required this.status,
    required this.service,
    required this.timestamp,
  });

  StatusResponseStatusEnum status;

  StatusResponseServiceEnum service;

  DateTime timestamp;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusResponse &&
    other.status == status &&
    other.service == service &&
    other.timestamp == timestamp;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (status.hashCode) +
    (service.hashCode) +
    (timestamp.hashCode);

  @override
  String toString() => 'StatusResponse[status=$status, service=$service, timestamp=$timestamp]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'status'] = this.status;
      json[r'service'] = this.service;
      json[r'timestamp'] = this.timestamp.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [StatusResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'status'), 'Required key "StatusResponse[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "StatusResponse[status]" has a null value in JSON.');
        assert(json.containsKey(r'service'), 'Required key "StatusResponse[service]" is missing from JSON.');
        assert(json[r'service'] != null, 'Required key "StatusResponse[service]" has a null value in JSON.');
        assert(json.containsKey(r'timestamp'), 'Required key "StatusResponse[timestamp]" is missing from JSON.');
        assert(json[r'timestamp'] != null, 'Required key "StatusResponse[timestamp]" has a null value in JSON.');
        return true;
      }());

      return StatusResponse(
        status: StatusResponseStatusEnum.fromJson(json[r'status'])!,
        service: StatusResponseServiceEnum.fromJson(json[r'service'])!,
        timestamp: mapDateTime(json, r'timestamp', r'')!,
      );
    }
    return null;
  }

  static List<StatusResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusResponse> mapFromJson(dynamic json) {
    final map = <String, StatusResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusResponse-objects as value to a dart map
  static Map<String, List<StatusResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'status',
    'service',
    'timestamp',
  };
}


class StatusResponseStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const StatusResponseStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ok = StatusResponseStatusEnum._(r'ok');

  /// List of all possible values in this [enum][StatusResponseStatusEnum].
  static const values = <StatusResponseStatusEnum>[
    ok,
  ];

  static StatusResponseStatusEnum? fromJson(dynamic value) => StatusResponseStatusEnumTypeTransformer().decode(value);

  static List<StatusResponseStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusResponseStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusResponseStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusResponseStatusEnum] to String,
/// and [decode] dynamic data back to [StatusResponseStatusEnum].
class StatusResponseStatusEnumTypeTransformer {
  factory StatusResponseStatusEnumTypeTransformer() => _instance ??= const StatusResponseStatusEnumTypeTransformer._();

  const StatusResponseStatusEnumTypeTransformer._();

  String encode(StatusResponseStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a StatusResponseStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusResponseStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ok': return StatusResponseStatusEnum.ok;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [StatusResponseStatusEnumTypeTransformer] instance.
  static StatusResponseStatusEnumTypeTransformer? _instance;
}



class StatusResponseServiceEnum {
  /// Instantiate a new enum with the provided [value].
  const StatusResponseServiceEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const monorepoApi = StatusResponseServiceEnum._(r'monorepo-api');

  /// List of all possible values in this [enum][StatusResponseServiceEnum].
  static const values = <StatusResponseServiceEnum>[
    monorepoApi,
  ];

  static StatusResponseServiceEnum? fromJson(dynamic value) => StatusResponseServiceEnumTypeTransformer().decode(value);

  static List<StatusResponseServiceEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusResponseServiceEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusResponseServiceEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusResponseServiceEnum] to String,
/// and [decode] dynamic data back to [StatusResponseServiceEnum].
class StatusResponseServiceEnumTypeTransformer {
  factory StatusResponseServiceEnumTypeTransformer() => _instance ??= const StatusResponseServiceEnumTypeTransformer._();

  const StatusResponseServiceEnumTypeTransformer._();

  String encode(StatusResponseServiceEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a StatusResponseServiceEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusResponseServiceEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'monorepo-api': return StatusResponseServiceEnum.monorepoApi;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [StatusResponseServiceEnumTypeTransformer] instance.
  static StatusResponseServiceEnumTypeTransformer? _instance;
}


