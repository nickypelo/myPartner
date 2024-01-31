
import 'package:provider/provider.dart';

import '../../features/authentication/data/models/relationship_model.dart';
import '../../features/authentication/data/models/user.dart';
import '../../features/authentication/data/models/user_details.dart';
import '../../features/authentication/data/repository/auth_service.dart';
import '../../features/authentication/data/repository/relationship_repo_impl.dart';
import '../../features/authentication/data/repository/user_details_epo_impl.dart';
import '../../features/information/data/models/food_model.dart';
import '../../features/information/data/models/highlight_model.dart';
import '../../features/information/data/models/interest_model.dart';
import '../../features/information/data/models/lady_model.dart';
import '../../features/information/data/models/music_model.dart';
import '../../features/information/data/models/personality_model.dart';
import '../../features/information/data/repository/food_repo.dart';
import '../../features/information/data/repository/highlight_repo.dart';
import '../../features/information/data/repository/interest_repo.dart';
import '../../features/information/data/repository/lady_repo.dart';
import '../../features/information/data/repository/music_repo.dart';
import '../../features/information/data/repository/personality_repo.dart';
import '../../features/information/presentation/provider/notification_provider.dart';

final appProviders = [
  StreamProvider<AppUser?>.value(value: AuthService().user,initialData: null,catchError: (_,__){return null;},),
  StreamProvider<List<FoodModel>>.value(value: FoodRepo(uid: '').food, initialData: const []),
  StreamProvider<List<HighlightModel>>.value(value: HighlightRepo(uid: '').highlight, initialData: const []),
  StreamProvider<List<InterestModel>>.value(value: InterestRepo(uid: '').interest, initialData: const []),
  StreamProvider<List<LadyModel>>.value(value: LadyRepo(uid: '').lady, initialData: const []),
  StreamProvider<List<MusicModel>>.value(value: MusicRepo(uid: '').music, initialData: const []),
  StreamProvider<List<PersonalityModel>>.value(value: PersonalityRepo(uid: '').personality, initialData: const []),
  StreamProvider<List<UserDetailsModel>>.value(value: UserDetailsRepoImpl().userDetails, initialData: const []),
  StreamProvider<List<RelationshipModel>>.value(value: RelationshipRepoImpl().couples, initialData: const []),
  ChangeNotifierProvider(create:  (context) => MessageProvider())
];
