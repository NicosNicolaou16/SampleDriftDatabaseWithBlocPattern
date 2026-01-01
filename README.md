# Sample Drift Database With Bloc Pattern

[![Linktree](https://img.shields.io/badge/linktree-1de9b6?style=for-the-badge&logo=linktree&logoColor=white)](https://linktr.ee/nicos_nicolaou)
[![Static Badge](https://img.shields.io/badge/Site-blue?style=for-the-badge&label=Web)](https://nicosnicolaou16.github.io/)
[![X](https://img.shields.io/badge/X-%23000000.svg?style=for-the-badge&logo=X&logoColor=white)](https://twitter.com/nicolaou_nicos)
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/nicos-nicolaou-a16720aa)
[![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@nicosnicolaou)
[![Mastodon](https://img.shields.io/badge/-MASTODON-%232B90D9?style=for-the-badge&logo=mastodon&logoColor=white)](https://androiddev.social/@nicolaou_nicos)
[![Bluesky](https://img.shields.io/badge/Bluesky-0285FF?style=for-the-badge&logo=Bluesky&logoColor=white)](https://bsky.app/profile/nicolaounicos.bsky.social)
[![Dev.to blog](https://img.shields.io/badge/dev.to-0A0A0A?style=for-the-badge&logo=dev.to&logoColor=white)](https://dev.to/nicosnicolaou16)
[![YouTube](https://img.shields.io/badge/YouTube-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white)](https://www.youtube.com/@nicosnicolaou16)
[![Static Badge](https://img.shields.io/badge/Developer_Profile-blue?style=for-the-badge&label=Google)](https://g.dev/nicolaou_nicos)

This project is an application that utilizes the BLoC architecture pattern, Dio
for network management, and Drift for local database storage.

# This Project contains:

[Bloc Patterns](https://pub.dev/packages/flutter_bloc) along with repositories
and services, separates business logic, data access, and UI by using streams to handle state and
manage data flow. ([Bloc Pattern Documentation](https://bloclibrary.dev/getting-started/)) <br />
[Dio Network Manager](https://pub.dev/packages/dio) is responsible for making requests and
retrieving data from the remote server. <br />
[Drift Database](https://drift.simonbinder.eu/docs/getting-started/) is responsible for saving the
retrieved data from the remote server, querying data from the local database, and supporting offline
functionality. ([Drift Database Documentation](https://pub.dev/packages/drift)) <br />
[Cached Network Image](https://pub.dev/packages/cached_network_image) is a package that it is
responsible for loading the images and supports offline functionality.  <br />

> [!IMPORTANT]  
> Similar project with :point_right: [SampleBlocPatternWithSingleState](https://github.com/NicosNicolaou16/SampleBlocPatternWithSingleState) :point_left: <br />

# Versioning

Flutter SDK version: 3.38.5 <br />
Dart Version: 3.10.4 <br />

# Feeds/Urls/End Point (parsing some data from response)

## (Links References for Ends Points)

https://github.com/r-spacex/SpaceX-API (GitHub) <br />
https://docs.spacexdata.com/?version=latest (Postman) <br />

# References

https://bloclibrary.dev/#/gettingstarted <br />
https://bloclibrary.dev/#/fluttertimertutorial?id=flutter-timer-tutorial <br />
https://ppantaleon.medium.com/flutter-blocbuilder-vs-blocconsumer-vs-bloclistener-a4a3ce7bfa9a <br />
https://stackoverflow.com/questions/59188021/why-usually-theres-a-repository-layer-on-bloc-pattern <br />
https://stackoverflow.com/questions/73811123/how-to-stop-dio-get-when-the-internet-is-off <br />
https://stackoverflow.com/questions/61381265/stop-showing-error-from-http-or-dio-request <br />
https://pub.dev/packages/dio#handling-errors <br />
