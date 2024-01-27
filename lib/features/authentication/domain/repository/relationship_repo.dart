import 'package:girlfriend_translator/features/authentication/domain/entities/relationship_entity.dart';

abstract class RelationshipRepository{
  Future<void> addRelationship(RelationshipEntity couple);
}