import '../entities/relationship_entity.dart';

abstract class RelationshipRepository{
  Future<void> addRelationship(RelationshipEntity couple);
}