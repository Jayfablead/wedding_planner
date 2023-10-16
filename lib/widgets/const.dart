
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:wedding_planner/Modal/AddguestModal.dart';
import 'package:wedding_planner/Modal/ChangepassModal.dart';
import 'package:wedding_planner/Modal/ChatListModal.dart';
import 'package:wedding_planner/Modal/CheckListModal.dart';
import 'package:wedding_planner/Modal/ForgotpassModal.dart';
import 'package:wedding_planner/Modal/FullchatModal.dart';
import 'package:wedding_planner/Modal/ReadnewmsgModal.dart';
import 'package:wedding_planner/Modal/RemoveguestModal.dart';
import 'package:wedding_planner/Modal/SendmessageModal.dart';
import 'package:wedding_planner/Modal/UnreadmsgModal.dart';
import 'package:wedding_planner/Modal/UpdateprofileModal.dart';
import 'package:wedding_planner/Modal/UserModal.dart';
import 'package:wedding_planner/Modal/UserProfileModal.dart';
import 'package:wedding_planner/Modal/VenuedetailModal.dart';
import 'package:wedding_planner/Modal/ViewguestModal.dart';
import 'package:wedding_planner/Modal/addchecklistmodal.dart';

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
UserModal? userData;
ForgotpassModal? forgotpass;
ChangepassModal? changepass;
UpdateprofileModal? updateprofile;
UserProfileModal? userprofile;
CheckListModal? checklistmodal;
ChatListModal? chatlistmodal;
SendmessageModal? sendmessageModal;
FullchatModal? fullchatmodal;
AddchecklistModal? addchecklistmodal;
UnreadmsgModal? unreadmsgmodal;
ReadnewmsgModal?  readnewmsgmodal;
VenuedetailModal? venuedetail;
AddguestModal? addguestmodal;
ViewguestModal? viewguestmodal;
RemoveguestModal? removeguestmodal;
const String baseUrl = 'https://wedding.fableadtechnolabs.com/wedding/portal/api';
