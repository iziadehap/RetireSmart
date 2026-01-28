enum FailureType { cashError, requestError, internetError }

class Failure {
  final FailureType failureType;
  final String message;
  Failure(this.message, this.failureType);
}
