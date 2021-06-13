import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/main.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/splash_screen.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_page.dart';
import 'package:talawa/views/after_auth_screens/events/event_info_page.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed_page/individual_post.dart';
import 'package:talawa/views/after_auth_screens/feed_page/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/feed_page/pinned_post_page.dart';
import 'package:talawa/views/after_auth_screens/profile/edit_profile_page.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/main_screen.dart';
import 'package:talawa/views/pre_auth_screens/change_password.dart';
import 'package:talawa/views/pre_auth_screens/login.dart';
import 'package:talawa/views/pre_auth_screens/recover.dart';
import 'package:talawa/views/pre_auth_screens/select_language.dart';
import 'package:talawa/views/pre_auth_screens/select_organization.dart';
import 'package:talawa/views/pre_auth_screens/set_url.dart';
import 'package:talawa/views/pre_auth_screens/signup_details.dart';
import 'package:talawa/views/pre_auth_screens/waiting_to_join_private_org.dart';

import 'constants/routing_constants.dart';
import 'models/events/event_model.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return MaterialPageRoute(
          builder: (context) => const SplashScreen(key: Key('SplashScreen')));
    case Routes.languageSelectionRoute:
      final int selectedLangId = int.parse(settings.arguments!.toString());
      return MaterialPageRoute(
          builder: (context) => SelectLanguage(
                key: const Key('SelectLanguage'),
                selectedLangId: selectedLangId,
              ));
    case Routes.setUrlScreen:
      final String uri = settings.arguments!.toString();
      return MaterialPageRoute(
          builder: (context) => SetUrl(
                key: const Key('SetUrl'),
                uri: uri,
              ));
    case Routes.loginScreen:
      return MaterialPageRoute(
          builder: (context) => const Login(key: Key('Login')));
    case Routes.selectOrgScreen:
      final String id = settings.arguments!.toString();
      return CupertinoPageRoute(
          builder: (context) => SelectOrganization(
                key: const Key('Signup'),
                selectedOrgId: id,
              ));
    case Routes.signupDetailScreen:
      final OrgInfo org = settings.arguments! as OrgInfo;
      return CupertinoPageRoute(
          builder: (context) => SignUpDetails(
                key: const Key('Signup'),
                selectedOrg: org,
              ));
    case Routes.waitingScreen:
      return CupertinoPageRoute(
          builder: (context) => const WaitingPage(key: Key('Waiting')));
    case Routes.recoverScreen:
      return MaterialPageRoute(
          builder: (context) => const Recover(key: Key('Recover')));
    case Routes.updateScreen:
      return MaterialPageRoute(
          builder: (context) => const ChangePass(key: Key('Update')));
    case Routes.homeScreen:
      return MaterialPageRoute(
          builder: (context) => const OrganizationFeed(key: Key('HomeScreen')));
    case Routes.mainScreen:
      return MaterialPageRoute(
          builder: (context) => const MainScreen(key: Key('MainScreen')));
    case Routes.individualPost:
      final Post post = settings.arguments! as Post;
      return MaterialPageRoute(
          builder: (context) => IndividualPostView(
                key: const Key('IndividualPost'),
                post: post,
              ));
    case Routes.pinnedPostpage:
      final List<Post> pinnedPosts = settings.arguments! as List<Post>;
      return MaterialPageRoute(
          builder: (context) => PinnedPostPage(pinnedPosts: pinnedPosts));
    case Routes.exploreEventsScreen:
      return MaterialPageRoute(
          builder: (context) => const ExploreEvents(key: Key('ExploreEvents')));
    case Routes.eventInfoPage:
      final Event event = settings.arguments! as Event;
      return MaterialPageRoute(
        builder: (context) =>
            EventInfoPage(key: const Key('EventInfo'), event: event),
      );
    case Routes.createEventPage:
      return MaterialPageRoute(
          builder: (context) => const CreateEventPage(key: Key('CreateEvent')));
    case Routes.profilePage:
      return MaterialPageRoute(
          builder: (context) => const ProfilePage(key: Key('Profile')));
    case Routes.editProfilePage:
      return MaterialPageRoute(
          builder: (context) => const EditProfilePage(key: Key('EditProfile')));
    default:
      return MaterialPageRoute(
          builder: (context) => const DemoPageView(
                key: Key("DemoPage"),
              ));
  }
}
