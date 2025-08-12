class ApiEndpoints {
  ApiEndpoints._();

  // Base paths
  static const String _apiBase = '/api';
  static const String _methodBase = '$_apiBase/method';
  static const String _resourceBase = '$_apiBase/resource';

  // Authentication endpoints
  static const String login = '$_methodBase/checktrack_connector.auth.mobile_login';
  static const String logout = '$_methodBase/logout';
  static const String _getUserDetails = '$_resourceBase/User/{user_id}';

  // Doctype endpoints
  static const String _getDoctypeRecords = '$_methodBase/frappe.desk.form.load.getdoc?doctype={doctype}&name={name}';
  static const String _getDoctypeMetadata = '$_methodBase/frappe.desk.form.load.getdoctype?doctype={doctype}';
  static const String _getDoctypeResource = '$_resourceBase/DocType/{doctype}';
  static const String getBottomBarConfig = '$_resourceBase/';

  // Utility methods
  static String getDoctypeMetadata(String doctype) {
    return _getDoctypeMetadata.replaceAll('{doctype}', doctype);
  }

  static String getDoctypeResource(String doctype) {
    return _getDoctypeResource.replaceAll('{doctype}', doctype);
  }

  static String getUserDetails(String userId) {
    return _getUserDetails.replaceAll('{user_id}', userId);
  }

  static String getDoctypeRecords(String doctype, String? name) {
    String endpoint = _getDoctypeRecords.replaceAll('{doctype}', doctype);
    if (name != null) {
      endpoint = endpoint.replaceAll('{name}', name);
      print("nameeeeFromPackage:$name");
    } else {
      endpoint = endpoint.replaceAll('&name={name}', '');
    }
    return endpoint;
  }
}