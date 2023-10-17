class ServiceException implements Exception {
  final String errorMessage;

  ServiceException({required this.errorMessage});
}
