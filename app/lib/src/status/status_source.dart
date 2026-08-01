class ApiStatus {
  const ApiStatus({required this.status, required this.service});

  final String status;
  final String service;
}

abstract interface class StatusSource {
  Future<ApiStatus> fetchStatus();
}
