import 'package:jobsque/view/HomePage/Applied/applied_screen.dart';
import 'package:jobsque/view/HomePage/Home/ApplyJob/widget/Company_screen.dart';
import 'package:jobsque/view/HomePage/Home/ApplyJob/widget/apply_job/TypeOfWork_Screen.dart';
import 'package:jobsque/view/HomePage/Home/ApplyJob/widget/apply_job/biodata_screen.dart';
import 'package:jobsque/view/HomePage/Home/ApplyJob/widget/apply_job/uploadProtfolio_screen.dart';
import 'package:jobsque/view/HomePage/Home/ApplyJob/widget/descriebtion_screen.dart';
import 'package:jobsque/view/HomePage/Home/ApplyJob/widget/people_screen.dart';
import 'package:jobsque/view/HomePage/Home/home_screen.dart';
import 'package:jobsque/view/HomePage/Messages/MessageScreen.dart';
import 'package:jobsque/view/HomePage/Profile/view/ProfileScreen.dart';
import 'package:jobsque/view/HomePage/Saved/SavedScreen.dart';

List screens = const [
  HomeScreen(),
  MessageScreen(),
  AppliedScreen(),
  SavedScreen(),
  ProfileScreen()
];
List tabs = [CustomDescription(), DetialsCompany(), PeopleScreen()];

List applyJobs = [BioDataScreen(), TypeOfWorkScreen(), UploadProtfolioScreen()];

List countycode = [
  'ar-eg',
  'de',
  'en',
  'es',
  'fr',
  'it',
  'ar-iq',
  'ar-sa',
  'ar-kw',
  'ar-bh',
  'ar-lb',
  'ca',
  'ar-ma',
  'ar-qa',
  'ar-sy',
  'ar-tn',
];
