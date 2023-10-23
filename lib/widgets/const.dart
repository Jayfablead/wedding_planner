import 'package:connectivity/connectivity.dart';
import 'package:wedding_planner/Modal/AddguestModal.dart';
import 'package:wedding_planner/Modal/AddtobudgetModal.dart';
import 'package:wedding_planner/Modal/AddtofavouriteModal.dart';
import 'package:wedding_planner/Modal/ChangepassModal.dart';
import 'package:wedding_planner/Modal/ChatListModal.dart';
import 'package:wedding_planner/Modal/CheckListModal.dart';
import 'package:wedding_planner/Modal/FavouritelistModal.dart';
import 'package:wedding_planner/Modal/ForgotpassModal.dart';
import 'package:wedding_planner/Modal/FullchatModal.dart';
import 'package:wedding_planner/Modal/HomeModal.dart';
import 'package:wedding_planner/Modal/MybudgetModal.dart';
import 'package:wedding_planner/Modal/NotificationModal.dart';
import 'package:wedding_planner/Modal/ReadnewmsgModal.dart';
import 'package:wedding_planner/Modal/ReadnotiModal.dart';
import 'package:wedding_planner/Modal/RemovefrombudgetModal.dart';
import 'package:wedding_planner/Modal/RemoveguestModal.dart';
import 'package:wedding_planner/Modal/SendQuationModal.dart';
import 'package:wedding_planner/Modal/SendmessageModal.dart';
import 'package:wedding_planner/Modal/SetbudgetModal.dart';
import 'package:wedding_planner/Modal/UnreadmsgModal.dart';
import 'package:wedding_planner/Modal/UnreadnotiModal.dart';
import 'package:wedding_planner/Modal/UpdateprofileModal.dart';
import 'package:wedding_planner/Modal/UserModal.dart';
import 'package:wedding_planner/Modal/UserProfileModal.dart';
import 'package:wedding_planner/Modal/VenuedetailModal.dart';
import 'package:wedding_planner/Modal/ViewPostModal.dart';
import 'package:wedding_planner/Modal/ViewguestModal.dart';
import 'package:wedding_planner/Modal/addchecklistmodal.dart';
import 'package:wedding_planner/Modal/markcompletedmodal.dart';
import 'package:wedding_planner/Modal/removetodoModal.dart';

import '../Modal/AddpostModal.dart';
import '../Modal/CategoriesModal.dart';
import '../Modal/DocumentModal.dart';
import '../Modal/MeetingModal.dart';
import '../Modal/QouteDetailsModal.dart';
import '../Modal/QuotationAcceptModal.dart';
import '../Modal/QuoteListModal.dart';
import '../Modal/SupplierdetailModal.dart';
import '../Modal/mySupplierModal.dart';

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
ReadnewmsgModal? readnewmsgmodal;
VenuedetailModal? venuedetail;
AddguestModal? addguestmodal;
ViewguestModal? viewguestmodal;
RemoveguestModal? removeguestmodal;
MarkcompletedModal? markcompletemodal;
NotificationModal? notificationmodal;
HomeModal? homemodal;
ReadnotiModal? readnotimodal;
UnreadnotiModal? unreadnotimodal;
removeTodoModal? removetodo;
AddtofavouriteModal? addtofavouritemodal;
FavouritelistModal? favouritelistmodal;
SetbudgetModal? setbudgetmodal;
RemovefrombudgetModal? removefrombudget;
AddtobudgetModal? addtobudgetmodal;
MybudgetModal? mybudgetmodal;
SupplierdetailModal? supplierdetailmodal;
CategoriesModal? categoriesmodal;
ViewPostModal? viewpostmodal;
AddpostModal? addpostmodal;
SendQuationModal? sendquationmodal;
QuoteListModal? quotelistmodal;
QouteDetailsModal? quotedetailsmodal;
QouteAcceptModal? qouteacceptmodal;
MeetingModal? meetingmodal;
DocumentModal? documentmodal;
MySuppliersModal? mysupps;



const String baseUrl =
    'https://wedding.fableadtechnolabs.com/wedding/portal/api';
