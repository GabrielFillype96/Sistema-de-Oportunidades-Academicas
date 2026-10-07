import '../models/application.dart';

class ApplicationRepository {
  // When the students applies, create an application object to display
  static final List<Application> _applications = [];

  // "static" variables means that we can instantiate them directly
  static void addApplication(Application application) {
    _applications.add(application);
  }

  static List<Application> getApplications() {
    return List.unmodifiable(_applications);
  }
}