import 'package:girlfriend_translator/features/authentication/domain/entities/relationship_entity.dart';

class RelationshipModel extends RelationshipEntity{
  RelationshipModel({
    required boyfriend,
    required girlfriend
  }) : super(
    boyfriend: boyfriend,
    girlfriend: girlfriend,
  );

  Map<String, dynamic> relationshipMap(){
    return {
      'boyfriend': boyfriend,
      'girlfriend': girlfriend,
    };
  }
}