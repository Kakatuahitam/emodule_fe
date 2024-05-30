mixin ValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue?.isEmpty ?? true;

  bool validateUsername(String username) {
    if (username == null) {
      return false;
    }

    if (username.length > 50) {
      return false;
    }

    if (!RegExp(r'^[\w]+$').hasMatch(username)) {
      return false;
    }

    return true;
  }

  bool validateFirstName(String firstName) {
    if (firstName == null) {
      return false;
    }

    if (firstName.length > 50) {
      return false;
    }

    return true;
  }

  bool validateLastName(String lastName) {
    if (lastName == null) {
      return false;
    }

    if (lastName.length > 50) {
      return false;
    }

    return true;
  }

  bool validatePassword(String password) {
    if (password == null) {
      return false;
    }

    if (password.length > 50) {
      return false;
    }

    return true;
  }

  bool validateEmailAddress(String email) {
    if (email == null) {
      return false;
    }

    if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email)) {
      return false;
    }

    return true;
  }
}
