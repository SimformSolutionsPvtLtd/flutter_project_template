enum NetworkState {
  idle,
  loading,
  success,
  error;

  bool get isIdle => this == idle;

  bool get isLoading => this == loading;

  bool get isSuccessful => this == success;

  bool get isFailed => this == error;
}

enum SharedPrefsKeys { isLoggedIn }

enum SecureStorageKeys { kAccessToken }
